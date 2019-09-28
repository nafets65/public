This is small programming language for determining result of a given Boolean formula. It has basic operators for Boolean logic like **/\\ (and), \\/ (or), ! (not), => (implication), <==> (equivalent)** and **\:=** for value assignment.


You can define your own variables and give them names and values like:

>**p := True**

>**q := False**


or give them return value of some expression


>**r := p <=> q**


If variable is not defined error appears.


Examples:


>**p := True**

>**q := False**

>**r := p <=> q**

>**p /\\ q <=> r <=> True**                     |Result: **True**

>**!p => q \\/ r <=> s**                        |Result: **Variable s is not defined.**


If variable exists but don't have value undef will appear.


>**p := True**

>**q := False**

>**p /\\ q \\/ s**                               |Result: **Undef**

>**p \\/ s \\/ q**                               |Result: **True**

>**!(q => s)**                                   |Result: **False**
