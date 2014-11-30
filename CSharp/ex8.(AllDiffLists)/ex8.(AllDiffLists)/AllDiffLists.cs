using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Characteristic
{
    class AllDiffLists
    {
        public static void allDiffLists(int range, int length, Predicate<int> check, Action print)
        {
            Action prolongPrint;
            Predicate<int> extendCheck; 
            for (int i = 1; i <= range; i++)
            {
                if (!check(i))
                {
                    if (length > 0)
                    {
                        extendCheck= param => param == i || check(param) ;
                        prolongPrint = () => { print.Invoke(); Console.Write(i); Console.Write(" "); };
                        allDiffLists(range, length - 1, extendCheck, prolongPrint);
                    }
                    else
                    {
                        print.Invoke();
                        Console.WriteLine();
                    }
                }
            }
        }

        static void Main(string[] args)
        {
            // Using action to perform Continuous Prints
            Action defPrint = () => { Console.Write(""); };
            // Using predicate to implement Charecteristic Functions
            Predicate<int> defCheck = param => false;
            // Default Range & Length
            int range = 3;
            int length = 2;
            allDiffLists(range, length, defCheck, defPrint);
        }
    }
}
