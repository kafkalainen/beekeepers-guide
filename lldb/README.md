## How to get school debugger on your desktop

School machines have `lldb` debugger tool installed on them as a tool. You can read more from
[here](https://lldb.llvm.org/). Lldb is really powerful debugging tool, which allows you to debug C code line by line,
and is also at your disposal in exams. Although, it is not only tool available, as
VSCode and others have excellent debugging tools, I'm going to focus on `lldb`

`apt install lldb`

You can start debugging your program by writing `lldb a.out`, if your binary name is `a.out`.
Note that you must compile your program with `-g` flag to see all lines!

Most likely you will see that your program has ran successfully, or in scenario
that it doesn't, you will see the error message.

	Process 1072840 launched:
	Fail
	Process 1072840 exited with status = 0 (0x00000000)

`lldb a.out Marvin`

You can give arguments to program by writing them after the command.

Command | Explanation
----|-----
`b 42` | Add breakpoint to row of a file.
`b function_i_want_to_debug` | Set the breakpoint to a function.
`b function_file.c:42` | Define specific row of a file.
`b` | List active breakpoints.
`br del 1` | Delete first one in the active breakpoints.
`p hello` | Print value of variable hello.
`parray 10 hello` | print 10 values in an array hello.
`v` | List all variables in function.
`p ft_why_you_are_not_printing_abc(abc, 3)` | If you pass a function with variables, you get the answer immidiately. Great when trying to find out which parameters give a wrong result in a certain function.
