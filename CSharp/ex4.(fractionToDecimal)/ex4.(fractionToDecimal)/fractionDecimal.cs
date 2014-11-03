using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FractionToDecimal
{
    class FractionDecimal
    {
        /*
         *  Converts Fration to Decimal approximation list
         *  @ (1 / denominator) - input Fraction
         */
        private static IEnumerable<int> digits(int denominator)
        {
            // Setting fraction: numerator / denominator
            int numerator = 1;
            int nextDigit = 0;
            // Running decimal calculation 
            for (int i = 0; ; i++)
            {
                numerator *= 10;
                nextDigit = numerator / denominator;
                yield return nextDigit;
                numerator = numerator % denominator;
            }
        }
        
        /*
         *  Prints Decimal Representation
         */
        public static void printDecimal(int denominator, int precision)
        {
            System.Console.Write("Decimal Represantation of 1 / ");
            System.Console.Write(denominator);
            System.Console.WriteLine(" :\n");
            foreach (int nextDigit in digits(denominator).Take(precision))
            {
                System.Console.Write(nextDigit);
                System.Console.Write(" ");
            }
            System.Console.WriteLine("\n");
        }

        static void Main(string[] args)
        {
            // Example
            int denominator = 7;
            int precision = 100;
            printDecimal(denominator, precision);
        }
    }
}
