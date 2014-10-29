using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EnumerableDividers
{
    class Dividers
    {
        /*
         * Search dividers for set @dividend
         */
        static IEnumerable<int> declareDividers(int dividend)
        {
            // Define edge for dividers search
            int middle = dividend / 2;
            int remainder = 1;
            for (int i = 2; i < middle; i++)
            {
                // Evaluate division remainder
                remainder = dividend % i; 
                // Remember dividers
                if (remainder == 0)
                {
                    yield return i; 
                }
            }
        }

        /*
         *  Prints first @amountOfElements dividers of @dividend
         */
        static void printDividers (int dividend, int amountOfElements)
        {
            System.Console.Write("Dividers of ");
            System.Console.Write(dividend);
            System.Console.WriteLine(":");
            foreach (int divider in declareDividers(dividend).Take(amountOfElements)) {
                System.Console.Write(divider);
                System.Console.Write(" ");
            }
            System.Console.WriteLine();
        }

        static void Main(string[] args)
        {
            int dividend = 30; 
            int numOfDividers = 3;
            printDividers(dividend, numOfDividers);
        }
    }
}
