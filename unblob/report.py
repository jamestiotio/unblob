import traceback
from enum import Enum
from typing import List, Union

import attr


class Severity(Enum):
    """Represents possible problems encountered during execution"""

    ERROR = "ERROR"
    WARNING = "WARNING"


@attr.define(kw_only=True, frozen=True)
class Report:
    """A common base class for different reports"""

    severity: Severity

    def asdict(self) -> dict:
        return attr.asdict(self)


STR = Union[str, Exception]
"""STR is a workaround for UnknownError.exception & pyright, do not use elsewhere!

Note, that when you inline this type, the documentation for UnknownError.exception
as generated by pyright will be wrong.
It will also break the formatting for `black`, which is a big issue, as we have
a pyright comment there to work around pyright.

See:
    - https://www.attrs.org/en/stable/types.html#pyright
    - https://github.com/microsoft/pyright/blob/main/docs/comments.md#line-level-diagnostic-suppression

"""


def _convert_exception_to_str(obj: Union[str, Exception]) -> str:
    if isinstance(obj, str):
        return obj
    if isinstance(obj, Exception):
        e: Exception = obj
        return "".join(traceback.format_exception(type(e), e, e.__traceback__))
    raise ValueError("Invalid exception object", obj)


@attr.define(kw_only=True)
class UnknownError(Report):
    """Describes an exception raised during file processing"""

    severity: Severity = attr.field(default=Severity.ERROR)
    exception: STR = attr.field(  # pyright: reportGeneralTypeIssues=false
        converter=_convert_exception_to_str
    )
    """Exceptions are also formatted at construct time.

    `attrs` is not integrated enough with type checker/LSP provider `pyright` to include converters.

    See: https://www.attrs.org/en/stable/types.html#pyright
    """


@attr.define(kw_only=True)
class CalculateChunkExceptionReport(UnknownError):
    """Describes an exception raised during calculate_chunk execution"""

    start_offset: int
    # Stored in `str` rather than `Handler`, because the pickle picks ups structs from `C_DEFINITIONS`
    handler: str


@attr.define(kw_only=True)
class ExtractCommandFailedReport(Report):
    """Describes an error when failed to run the extraction command"""

    severity: Severity = Severity.WARNING
    command: str
    stdout: bytes
    stderr: bytes
    exit_code: int


@attr.define(kw_only=True)
class ExtractDirectoriesExistReport(Report):
    severity: Severity = Severity.ERROR
    paths: List[Path]


@attr.define(kw_only=True)
class ExtractorDependencyNotFoundReport(Report):
    """Describes an error when the dependency of an extractor doesn't exist"""

    severity: Severity = Severity.ERROR
    dependencies: List[str]


@attr.define(kw_only=True)
class MaliciousSymlinkRemoved(Report):
    """Describes an error when malicious symlinks have been removed from disk."""

    severity: Severity = Severity.WARNING
    link: str
    target: str
