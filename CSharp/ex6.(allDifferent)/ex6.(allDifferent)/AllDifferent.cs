using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ex6.allDifferent
{
    class AllDifferent
    {
        
        /*
         *   Recursive testing:
         *      "If array has all unique numbers or not?"
         */
        public static bool allDifferentSubFunc(int[] array, int from, Predicate<int> condition)
        {
            if (array.Length > from) {
                int element = array[from];
                // Creating a characteristic function via Predicate concat  
                Predicate<int> extendCondition = t => (t == element) || condition(t);
                bool test = condition(element);
                return (condition(element)) ? false : allDifferentSubFunc(array, (from + 1), extendCondition);
            } else {
                return true;
            }
        }
        
        /*
         *   Implementing simple interface
         */
        public static bool allDifferent(int[] array)
        {
            return allDifferentSubFunc(array, 0, x => false);
        }
        static void Main(string[] args)
        {
            int[] okArray = { 1, 2, 3, 4, 5, 10, 11 };
            int[] nokArray = {2, 3, 2};
            
            bool okTest = allDifferent(okArray);
            bool nokTest = allDifferent(nokArray);
            
            System.Console.Write("Ok test => ");
            System.Console.WriteLine(okTest);
            System.Console.Write("Nok test => ");
            System.Console.WriteLine(nokTest);
        }
    }
}
