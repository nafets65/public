This is small programming language for determining if there exists an interpretation that satisfies a given Boolean formula.

You can define your own variables and give them names and values like:

p := True
q := False

or give them return value of some expression

r := p <=> q

If variable is not defined error appears.

Examples:

p := True
q := False
r := p <=> q
p /\ q <=> r <=> True                     True
!p => q \/ r <=> s                        Variable s is not defined.

If variable exists but don't have value undef will appear.

p := True
q := False
p /\ q \/ s                               Undef
p \/ s \/ q                               True
!(q => s)                                 False