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
const long long infinity = 10000000000000001;
vector<long long> decision;
vector<arc> graph;
vector<vector<int>> graphDfs;
vector<bool> color;

void readFile(const string &fInName, int &nodes, int &edges, int &start)
{
	int first = 0;
	int end = 0;
	long long cost = 0;
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	infile >> start;
	for (int i = 0; i <= nodes; i++) {
		color.push_back(0);
		graphDfs.push_back(vector<int>());
	}
	// Create oriented graph
	while (infile >> first) {
		infile >> end;
		infile >> cost;
		graph.push_back(arc(first, end, cost));
		graphDfs[first].push_back(end);
	}
	for (int i = 0; i <= nodes; i++) {
		decision.push_back(infinity);
	}
	decision[start] = 0;
	infile.close();
}

void writeFile(string fOutName, const set<int> &way){
	ofstream outfile(fOutName);
	for (int i = 1; i < decision.size(); i++) {
		if (way.find(i) != way.end()) {
			outfile << '-' << "\n";
		}
		else if (decision[i] == infinity) {
			outfile << '*' << "\n";
		}
		else
		{
			outfile << decision[i] << "\n";
		}
	}
	outfile.close();
}

void dfs(int node, set<int> &storrage)
{
	color[node] = true;
	storrage.insert(node);
	for (vector<int>::iterator i = graphDfs[node].begin(); i != graphDfs[node].end(); i++) {
		if (!color[*i]) {
			dfs(*i, storrage);
		}
	}
}

void shortWay(int nodes, int edges, set<int> &incycle)
{
	set<int> relax;
	vector<int> parent(nodes + 1, 0);
	for (int i = 0; i <= nodes; i++) {
		for (int j = 0; j < edges; j++) {
			if (decision[graph[j].in] < infinity) {
				if (decision[graph[j].out] > (decision[graph[j].in] + graph[j].cost)) {
					decision[graph[j].out] = max(decision[graph[j].in] + graph[j].cost, -infinity);
					parent[graph[j].out] = graph[j].in;
					if (i >= nodes) {
						relax.insert(graph[j].out);
					}
				}
			}
		}
	}

	// Finds elements, which are in minus-weighted cycle
	if (relax.size() != 0) {
		for (set<int>::iterator i = relax.begin(); i != relax.end(); i++) {
			int current = *i;
			// Takes node that is for sure in cycle
			for (int j = 0; j < nodes; j++) {
				current = parent[current];
			}
			// relax - is in cycle
			// Finds cycled values & values whiñh are touched by cycle
			dfs(current, incycle);
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
	set<int> incycle;
	shortWay(nodes, edges, incycle);
	writeFile(fOutName, incycle);
	return 0;
}