# README
### Recording Server Service Checker

#### Table of Contents

[About](#about)  
[Getting Started](#getting-started)  
[Troubleshooting](#troubleshooting)  
[License](#license)

## About

These PowerShell scripts can provide a report of servers in the user's environment running Recording Server service, and those requiring a restart of it.

One script, **Recording Server Service Checker - Console Report**, does this by displaying the returned data within the PowerShell console.

The other script, **Recording Server Service Checker - .txt Reports**, will take the returned data and provide it in a .txt file created in C:\ with a prefix of **Recording Servers Down** and a timestamp suffix.

This script helps administrators of an enterprise-scale environment ensure in real time the status of remote servers and whether the Recording Server service is running, which is the primary requirement for our CompleteView 2020 software to perform network video recording.

## Getting Started

1. Create a .txt file with a list of server hostnames, one per line, that you wish to check the status of the Recording Server service on
2. Save this file where you choose, being careful to choose a path that does not include spaces
3. Determine whether you want a console report or a .txt report of the returned data
    * The biggest factor here is whether you are happy reviewing this in a console window, or if you have enough servers that a file would be easier to navigate
4. Launch the .ps1 file you chose (a double-click should suffice; if necessary, right-click and choose Run As Administrator)

## Troubleshooting

This script may not work if:

1. You provided a file path for your list of servers that includes spaces in it
2. You do not have the necessary permissions to run PowerShell scripts on the machine you are attempting to execute this script from
3. The version of PowerShell on the system you are using to execute this script is older/not supporting the commands in this script
4. You do not have the necessary permissions to run PowerShell scripts across your network

If you run into issues outside of the above, you may need to review the specific errors and/or troubleshoot the errors with your server/systems/IT administrator.

## License

Distributed under the MIT license.

Copyright 2021 James Anderson, Escalation Engineer, Salient Systems Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
