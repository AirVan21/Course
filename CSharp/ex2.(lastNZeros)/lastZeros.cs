using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ex2.LastNZero
{

    class SelectTutorial
    {
        /*
            Replases last 'amountOfZeros' digits in element with zeros
         */
        static int[] zeroDigits(int[] inputArray, int amountOfZeros) 
        {
            int degree = 1;
            // Calculating decimal power function
            for (int i = 0; i < amountOfZeros; i++)
            {
                degree *= 10;
            }
            // Performs element transformation along array
            return inputArray.Select(element => (element / degree) * degree).ToArray(); 
        }

        static void Main(string[] args)
        {
            // Setting parameters
            int zeroAmount = 2;
            int[] numbersFromLostFilm = {563, 5643, 76796, 32, 100};
            Console.Write("Input numbers:  ");
            Console.WriteLine(string.Join(", ", numbersFromLostFilm));
            // Perfrom Select
            int[] resultDigits = SelectTutorial.zeroDigits(numbersFromLostFilm, zeroAmount);
            Console.Write("Output numbers: ");
            Console.WriteLine(string.Join(", ", resultDigits));
        }
    }
}