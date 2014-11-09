syn match traceDate  /\d\{4}-\d\{2}-\d\{2}T/        nextgroup=traceTime
syn match traceTime  /\d\{1,}:\d\{2}:\d\{2}.\d\{6}/ nextgroup=traceID    skipwhite
syn match traceID    /\[\d\{7}\]/                   nextgroup=tracePcpu  skipwhite
syn match tracePcpu  /\[pcpu = \d\{1,}\]/           nextgroup=traceOpTag skipwhite
syn match traceOpTag /\[\x\{8}\]/                   nextgroup=traceKeyL1,traceKeyL2
"syn match traceKey   / \(DOM\)\w\+/   nextgroup=traceLine
syn match traceLine  /:\d\+:/
syn match traceUuid  /\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}/
syn match traceObjType  /\(CLIENT\|OWNER\|RAID1\|RAID0\|LEAF_OWNER\|WITNESS\|COMPONENT_SERVER\)/

syn match traceError /VMK_\u\{3,}[^',]*/
syn match traceObjStateL0 /\(ACTIVE\|CLEANUP\|TRANSIENT\)/
syn match traceObjStateL1 /\(ABSENT\|STALE\|DEGRADED\|RESYNCING\|RECONFIGURING\|NEED_CONFIG\)/

syn keyword traceKeyL1 DOMOperationInstantiateRoot DOMIOOperationInstantiateRoot
syn keyword traceKeyL1 DOMOperationInstantiateChildActivate DOMClientCreateCommand
syn keyword traceKeyL1 DOMNextResyncState DOMOwnerInstantiate
syn keyword traceKeyL1 DOMObjectSetState DOMObjectInitRootObject
syn keyword traceKeyL1 DOMReconcileCommit DOMReconcileAbort
syn keyword traceKeyL1 DOMObject_CleanupObjectTree
syn keyword traceKeyL1 DOMLostLiveness DOMRegainedLiveness

syn keyword traceKeyL2 LSOMQueueRequest LSOMCompleteRequest
syn keyword traceKeyL2 LSOMStartBitmap LSOMGCPUpdate

syn keyword traceOps commitTransaction write read readPolicy pruneBitmaps
syn keyword traceOps changeComponentPolicy readComponentLogEntries deleteComponent
syn keyword traceOps createComponent abortTransaction getReconcileLogs barrier
syn keyword traceOps delete ownerSetup readBitmap recoveryWrite readWriteResync

syn keyword traceErrorOK VMK_OK

hi traceDate  ctermfg=darkgrey
hi traceTime  ctermfg=darkred
hi traceID    ctermfg=darkgrey
hi tracePcpu  ctermfg=darkgreen
hi traceOpTag ctermfg=blue

"hi traceKey        ctermfg=white
hi traceKeyL1      ctermfg=yellow
hi traceKeyL2      ctermfg=darkyellow
hi traceLine       ctermfg=black

hi traceOps        ctermfg=darkcyan
hi traceObjType    ctermfg=red
hi traceObjStateL0 ctermfg=white
hi traceObjStateL1 ctermfg=magenta
hi traceError      ctermfg=darkred
hi traceErrorOK    ctermfg=green
hi traceUuid       ctermfg=darkmagenta
