syn match traceBegin   display '^' nextgroup=traceDate

syn match traceDate     contained display /\d\{4}-\d\{2}-\d\{2}/ nextgroup=traceDateT

syn match traceDate     contained display /\d\{2}\d\{2}\d\{2}/ nextgroup=traceDateT

syn match traceDateT    contained display /T/ nextgroup=traceTime

syn match traceTime     contained display /\d\{1,}:\d\{2}:\d\{2}.\d\{6}/ nextgroup=traceID skipwhite

syn match traceID       contained display /\[\d\+]/ nextgroup=tracePcpu  skipwhite

syn match tracePcpu     contained display /\[cpu\d\+]/ nextgroup=traceTags skipwhite

syn region traceTags    contained display start=/\[/ end=/\]/
                        \ contains=traceOpId,traceObjType,traceOps,traceCsn,traceLsn nextGroup=traceKey skipwhite

syn match traceOpId     contained display /\x\{7,16}/
syn match traceCsn      contained display /csn=\d\+/
syn match traceLsn      contained display /lsn=\d\+/

syn match traceKey      contained display /\(DOM\)\w\+/ nextgroup=traceKeyColon
syn match traceKeyColon contained display /:/ nextgroup=traceLine
syn match traceLine     contained display /\d\+/

syn match traceUuid     display /\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}/
syn match traceObjType  display /DOM_.*_\(CLIENT\|OWNER\|RAID1\|RAID0\|LEAF_OWNER\|WITNESS\|COMPONENT_SERVER\)/
syn match traceObjType  display /\(\<CLIENT\>\|\<OWNER\>\|\<RAID1\>\|\<RAID0\>\|\<LEAF_OWNER\>\|\<LEAF\>\|\<COMP\>\|\<WITNESS\>\|\<DISK\>\|\<CONCAT\>\|\<EVENT\>\)/

syn match traceError display /VMK_\(\u\|_\)\{3,}/
syn match traceObjStateL0 display /\(\<active\>\|\<initialize\>\|\<initialized\>\|\<cleanup\>\|\<transient\>\|\<invalid\>\|\<none\>\)/
syn match traceObjStateL1 display /\(\<stale\>\|\<degraded\>\|\<resyncing\>\|\<reconfiguring\>\|\<need-config\>\)/
syn match traceObjStateL2 display /\<absent\>/

syn match traceOpStateL0 display /DOM_[A-Z0-9_]_\(SEND_REQUEST\|COMPLETE_TASK\|WAIT_ON_PARENT_NOTIFY\)/
syn match traceOpStateL0 display /DOM_[A-Z0-9_]*_\(PROCESS_RESPONSE\|SEND_RESPONSE\|START_TASK\|PROCESS_REQUEST\)/
syn match traceOpStateL0 display /DOM_OP_STATE_[A-Z0-9_]*/

syn keyword traceKeyL1 DOMOperationInstantiateRoot DOMIOOperationInstantiateRoot
syn keyword traceKeyL1 DOMOperationInstantiateChildActivate DOMClientCreateCommand
syn keyword traceKeyL1 DOMNextResyncState DOMOwnerInstantiate 
syn keyword traceKeyL1 DOMObjectSetState DOMObjectInitRootObject
syn keyword traceKeyL1 DOMReconcileCommit DOMReconcileAbort
syn keyword traceKeyL1 DOMObject_CleanupObjectTree  DOMVsanIoctl
syn keyword traceKeyL1 DOMLostLiveness DOMRegainedLiveness DOMOpenDev DOMRemoveDev
syn keyword traceKeyL1 DOMReadLogEntriesCommitAbort DOMLeafObjectStateChange 
syn keyword traceKeyL1 DOMOwnerAPD DOMTraceOwnerIsLiveAPD
syn keyword traceKeyL1 OwnerStaleNotification DOMRootObjInstantiate

syn keyword traceKeyL2 LSOMQueueRequest LSOMCompleteRequest 
syn keyword traceKeyL2 LSOMStartBitmap LSOMGCPUpdate LSOMComponentOpen

syn keyword traceOps commitTransaction write read readPolicy pruneBitmaps
syn keyword traceOps changeComponentPolicy readComponentLogEntries deleteComponent
syn keyword traceOps createComponent abortTransaction getReconcileLogs barrier
syn keyword traceOps delete ownerSetup readBitmap recoveryWrite readWriteResync
syn keyword traceOps readWriteAts reconcile aggregateAttributes createComponentSnapshot
syn keyword traceOps create clientReset clientAbort establishRDT createCommit
syn keyword traceOps CMMDS_PUBLISH CMMDS_SUBSCR ROOT_OBJ_FACTORY DOM_EVENT

syn keyword traceErrorOK VMK_OK

hi def link traceDate           Constant
hi def link traceTime           Type
hi def link traceId             Constant
hi def link tracePcpu           Statement

hi def link traceOpId           PreProc
hi def link traceLsn            Comment
hi def link traceCsn            Comment

hi def link traceKeyL1          Identifier
hi def link traceKeyL2          Operator
hi def link traceLine           Constant
hi def link traceOps            Special
hi def link traceObjType        Type
hi def link traceObjStateL0     Type
hi def link traceObjStateL1     Statement
hi def link traceObjStateL2     ErrorMsg
hi def link traceOpStateL0      Statement
hi def link traceError          ErrorMsg
hi def link traceErrorOk        Number
hi def link traceUuid           Number
