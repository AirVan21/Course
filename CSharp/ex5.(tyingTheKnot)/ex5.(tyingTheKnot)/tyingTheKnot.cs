using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tyingTheKnot
{
    class Sequence367
    {
        /*
         *  Setting new sequence seria
         */
        public static int nextIteration(int inputNumber)
        {
            // Finding last digit != 7
            int addition = 0;
            int degree = 1;
            while (inputNumber % 10 == 7)
            {
                inputNumber = inputNumber / 10;
                addition = addition * 10 + 3;
                degree = degree * 10;
            }
            
            int lastDigit = inputNumber % 10;
            
            // Replace last digit with appropriate value
            switch (lastDigit)
            {
                case 3:
                    inputNumber = inputNumber - lastDigit + 6;
                    break;
                case 6:
                    inputNumber = inputNumber - lastDigit + 7;
                    break;
                default:
                    inputNumber = inputNumber - lastDigit + 3;
                    break;
            }

            return inputNumber * degree + addition;
        }

        /*
         *  Defining a sequence (tying the knot way)
         */
        public static IEnumerable<int> lst367()
        {
            // Set first sequence values
            yield return 3;
            // Using tying the knot method, generate sequence
            foreach (int lastNum in lst367()) {
                // Helpful variable
                int basis = lastNum - (lastNum % 10);
                int remainder = lastNum % 10;
                switch (remainder) {
                    case 3:
                            yield return (basis + 6); 
                            break;
                    case 6:
                            yield return (basis + 7);
                            break;
                    case 7:
                            yield return nextIteration(lastNum); // will be nextIteration(lastNum);
                            break;
                } 
            }
        }
        
        /*
         *  Printing a sequence
         */
        public static void printSequence(int amount)
        {
            System.Console.WriteLine("Sequence '367' :");
            foreach(int number in lst367().Take(amount)) {
                System.Console.Write(number);
                System.Console.Write(" ");
            }
            System.Console.WriteLine();
        }

        static void Main(string[] args)
        {
            // Testing step
            int amountOfElements = 25;
            printSequence(amountOfElements);
        }
    }
}
