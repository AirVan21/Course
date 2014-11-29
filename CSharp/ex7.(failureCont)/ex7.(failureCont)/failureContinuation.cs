using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FindImplementation
{
    class FailureContinuation
    {
        public static int find(Predicate<int> condition, int[] searchArray, Func<int> error)
        {
            int[] rightValues = searchArray.Where(number => condition(number)).ToArray();
            return rightValues.Length > 0 ? rightValues[0] : error.Invoke();
        }

        static void Main(string[] args)
        {
            // Defined error case return value
            const int defaultError = 20;
            Func<int> errorCase = () => defaultError;
            // Defined test conditions 
            Predicate<int> firstCondition = t => t < 10;
            Predicate<int> secondCondition = t => t < 20;
            // Testing suit
            int[] testFirstCondition =  { 12, 14, 6, 99, 31 };
            int[] testSecondCondition = { 99, 31, 66, 11, 82};
            int[] testError = {99, 22, 44, 55};

            // Testing
            
            Func<int> alternativeCase1 = () => find(secondCondition, testFirstCondition, errorCase);
            int result = find(firstCondition, testFirstCondition, alternativeCase1);
            System.Console.Write("Test on first condition  => ");
            System.Console.WriteLine(result);

            Func<int> alternativeCase2 = () => find(secondCondition, testSecondCondition, errorCase);
            result = find(firstCondition, testSecondCondition, alternativeCase2);
            System.Console.Write("Test on second condition => ");
            System.Console.WriteLine(result);

            Func<int> alternativeCase3 = () => find(secondCondition, testError, errorCase);
            result = find(firstCondition, testError, alternativeCase3);
            System.Console.Write("Test on second condition => ");
            System.Console.WriteLine(result);
        }
    }
}
