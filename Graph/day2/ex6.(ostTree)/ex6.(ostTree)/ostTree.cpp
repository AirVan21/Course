#pragma comment(linker, "/STACK:16777216")
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <set>
#include <algorithm>

using namespace std;

vector<int> color;
vector<pair<int, pair<int, int>>> graph;
vector<pair<int, int>> original;
set<pair<int, int>> result;
long weight;

void readFile(const string &fInName, int &nodes, int &edges)
{
	pair<int, int> arc;
	pair<int, pair<int, int>> element;
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	for (int i = 0; i <= nodes; i++) {
		color.push_back(i);
	}
	// Creates graph
	while (infile >> arc.first) {
		infile >> arc.second;
		infile >> element.first;
		element.second = arc;
		graph.push_back(element);
		original.push_back(arc);
	}
	// Arcs with lowest cost - first
	sort(graph.begin(), graph.end());
	infile.close();
}

void writeFile(string fOutName){
	ofstream outfile(fOutName);
	for (vector<pair<int, int>>::iterator i = original.begin(); i != original.end(); i++) {
		if (result.find(*i) != result.end()) {
			outfile << "YES\n";
		}
		else {
			outfile << "NO\n";
		}
	}
	outfile.close();
}


int main()
{
	string fInName = "byteland.in";
	string fOutName = "byteland.out";
	int edges = 0;
	int nodes = 0;
	int start = 0;
	int end = 0;
	int cost = 0;
	readFile(fInName, nodes, edges);
	
	for (vector<pair<int, pair<int, int>>>::iterator i = graph.begin(); i != graph.end(); i++) {
		start = i->second.first;
		end = i->second.second;
		cost = i->first;
		if (color[start] != color[end]) {
			weight += cost;
			result.insert(i->second);
			int prevVal = color[end];
			int newVal = color[start];
			for (int j = 1; j <= nodes; j++) {
				if (color[j] == prevVal) {
					color[j] = newVal;
				}
			}
		}
	}

	writeFile(fOutName);

	return 0;
}