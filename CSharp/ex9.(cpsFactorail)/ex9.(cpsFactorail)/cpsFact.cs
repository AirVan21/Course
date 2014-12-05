using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ContinuationPassingStyle
{
    class CPSFact
    {
        /*
         * Performing Continuation Passing Style for Factorial        
         */
        public static int cpsFactorial(int baseCounter, Func<int, int> passFunc)
        {
            Func<int, int> multOn = x => x * baseCounter;
            Func<int, int> updateFunc = x => multOn(passFunc(x));
            return baseCounter == 0 ? passFunc(1) :  cpsFactorial(baseCounter - 1, updateFunc);
        }
        
        static void Main(string[] args)
        {
            // Defining test constant
            int testNum = 5;
            Func<int, int> defaultFunc = x => 1;
            System.Console.Write(testNum);
            System.Console.Write("! = ");
            System.Console.WriteLine(cpsFactorial(testNum, defaultFunc));
        }
    }
}
