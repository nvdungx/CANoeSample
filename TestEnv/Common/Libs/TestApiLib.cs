using System;
using Vector.Tools;
using Vector.CANoe.Runtime;
using Vector.CANoe.Threading;
using Vector.CANoe.Sockets;
using Vector.Diagnostics;
using Vector.Scripting.UI;
using System.Security.Cryptography;
using System.Xml;
using System.IO;
using System.Linq;
using Vector.CANoe.Runtime.Internal;
using System.Collections.ObjectModel;
using System.Text;
using Vector.CANoe.TFS;
using System.Collections.Generic;
using System.Reflection;
using System.Collections;
using System.Globalization;

public class TestApiLib
{
    public static int GetHashValue(byte[] inputData, ref byte[] outputHash)
    {
        SHA256 sha = SHA256.Create();
        outputHash = sha.ComputeHash(inputData);
        return 1;
    }
}