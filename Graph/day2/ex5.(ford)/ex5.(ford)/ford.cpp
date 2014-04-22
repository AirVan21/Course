#pragma comment(linker, "/STACK:16777216")
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <set>


using namespace std;

// Struct represents edge in graph
struct arc {
	int in;
	int out;
	long long cost;

	// Constructor
	arc(int start, int end, long long weight) :
		in(start),
		out(end),
		cost(weight)
	{}
};

// global variables
const long long infinity = 0x6FFFFFFFFFFFFFF;
const long long min1 = 0xB000000000000001;
const long long min2 = 0xB000000000000000;
vector<long long> decision;
vector<long long> decision2;
vector<arc> graph;

void readFile(const string &fInName, int &nodes, int &edges, int &start)
{
	int first = 0;
	int end = 0;
	long long cost = 0;
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	infile >> start;
	// Create oriented graph
	while (infile >> first) {
		infile >> end;
		infile >> (long long)cost;
		graph.push_back(arc(first, end, cost));
	}
	for (int i = 0; i <= nodes; i++) {
		decision.push_back(infinity);
		decision2.push_back(0);
	}
	decision[start] = 0;
	infile.close();
}

void writeFile(string fOutName){
	ofstream outfile(fOutName);
	for (int i = 1; i < decision.size(); i++) {
		if (decision[i] == infinity) {
			outfile << '*' << "\n";
		}
		else if (decision2[i] != decision[i])
		{
			outfile << '-' << "\n";
		}
		else {
			outfile << (long long)decision[i] << "\n";
		}
	}
	outfile.close();
}

void shortWay(int nodes, int edges)
{
	for (int i = 0; i < nodes; i++) {
		for (int j = 0; j < edges; j++) {
			if (decision[graph[j].in] != infinity) {
				if (decision[graph[j].out] > (decision[graph[j].in] + graph[j].cost)) {
					decision[graph[j].out] =(long long) max(decision[graph[j].in] + graph[j].cost, min2);
				}
			}
		}
	}

	for (int i = 1; i <= nodes; i++) {
		decision2[i] = decision[i];
	}

	for (int i = 0; i <= nodes; i++) {
		for (int j = 0; j < edges; j++) {
			if (decision[graph[j].in] != infinity) {
				if (decision2[graph[j].out] > (decision2[graph[j].in] + graph[j].cost)) {
					decision2[graph[j].out] = min1;
				}
			}
		}
	}
}

int main()
{
	string fInName = "path.in";
	string fOutName = "path.out";
	int nodes = 0;
	int edges = 0;
	int start = 0;
	readFile(fInName, nodes, edges, start);
	shortWay(nodes, edges);
	writeFile(fOutName);
	return 0;
}