using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Fare;

namespace RegexTesting
{
    class RegexTesting
    {
        public static Automaton handleRegex(String representation)
        {      
            RegExp regex = new RegExp(representation);
            Automaton automaton = regex.ToAutomaton();

            Console.WriteLine("Default automaton representation for " + representation + " :\n");
            displayAutomaton(automaton);

            if (automaton.IsDeterministic)
            {
                Console.WriteLine("Automaton is Deterministic!\n");
            }
            else
            {
                automaton.Determinize();
                Console.WriteLine("Determinized automaton:\n");
                displayAutomaton(automaton);
            }

            automaton.Minimize();
            Console.WriteLine("Minimized automaton:\n");
            displayAutomaton(automaton);

            return automaton;
        }

        public static void displayAutomaton(Automaton automaton)
        {
            HashSet<State> states = automaton.GetStates();

            foreach (State item in states)
            {
                Console.WriteLine(item.ToString());
            }
        }

        public static void tests_3_1(Automaton automaton)
        {
            check(automaton.Run("__agent007__"));
            check(automaton.Run("_13"));
            check(automaton.Run("e2_e4"));

            check(!automaton.Run(""));
            check(!automaton.Run("1"));
            check(!automaton.Run("1st"));
        }

        public static void tests_3_2(Automaton automaton)
        {
        }

        public static void tests_3_3(Automaton automaton)
        {
            check(automaton.Run("[]"));
            check(automaton.Run("[1]"));
            check(automaton.Run("[1; 2;  3; 4; 5]"));

            check(!automaton.Run("]["));
            check(!automaton.Run("[[]]"));
            check(!automaton.Run("[1; 23    4; 5 ]"));
        }

        public static void check(bool result)
        {
            if (!result)
            {
                Console.WriteLine("Mistake!");
            }
        }

        static void Main(string[] args)
        {
            const String regex_2_1 = @"(a|b)*ab(a|b)*|(a|b)*a|b*";
            const String regex_2_2 = @"(a|b)*(ab|ba)(a|b)*|a*|b*";

            const String regex_3_1 = @"(_|[a-zA-Z])(_|[a-zA-Z]|[0-9])*";
            const String regex_3_2 = @"";
            const String regex_3_3 = @"\[( )*\]|\[(( )*(()|+|-)(0|([1-9]([0-9])*))( )*;)*( )*(()|+|-)(0|([1-9]([0-9])*))( )*\]";
        
            handleRegex(regex_2_1);
            handleRegex(regex_2_2);

            tests_3_1(handleRegex(regex_3_1));
            tests_3_2(handleRegex(regex_3_2));
            tests_3_3(handleRegex(regex_3_3));
        }
    }
}
