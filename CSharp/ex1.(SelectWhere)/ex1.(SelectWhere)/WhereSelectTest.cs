using System;
using System.Linq;

namespace ex1.MapFilterAnalog
{
    // First C# Code!
    class SelectWhereTest
    {
        /*
         * Gets last digits (except 0) from every number in inputArray via Select() 
         * 
         * @ inputArray - array of positive integer
         * @ result     - array of last digits
         */ 
        public static int[] nonZeroLastDigits(int[] inputArray)
        {
            int basis = 10;
            return inputArray.Select(number => (number % basis)).
                Where(number => (number % basis) != 0).ToArray();
        }
    
        static void Main(string[] args)
        {
            // Test values
            int [] numbersFromLostFilm = {4, 8, 15, 16, 23, 42, 60};
            Console.Write("Input numbers:  ");
            Console.WriteLine(string.Join(", ", numbersFromLostFilm));
            // Perfrom Select
            int[] lastDigits = SelectWhereTest.nonZeroLastDigits(numbersFromLostFilm);
            Console.Write("Output numbers: ");
            Console.WriteLine(string.Join(", ", lastDigits));
        }
    }
}
