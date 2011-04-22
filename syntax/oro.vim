:syntax clear
:syntax case match
:syntax match Identifier /\[thread [0-9]*\]/
:syntax keyword PreProc DEBUG 
:syntax match Type /\[[0-9]* [0-9:]*\]/ 
:syntax match Todo /\[!!\]/
:syntax match Error / [a-zA-Z\.]*Exception/
:syntax match Debug />>enter.*/
:syntax match Debug />>leave.*/
:syntax keyword Statement fing findForAgent add addForAgent remove removeForAgent clear clearForAgent update updateForAgent stats getInfos query
:syntax keyword Todo reset
:syntax keyword Error inconsistent
