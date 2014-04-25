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
vector<pair<int, pair<int, int>>> original;
vector<vector<int>> graphVect;
set<pair<int, int>> result;
set<pair<int, int>> alternative;
long weight;
int cycle_start = 0;
int cycle_end = 0;

void readFile(const string &fInName, int &nodes, int &edges)
{
	pair<int, int> arc;
	pair<int, pair<int, int>> element;
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	for (int i = 0; i <= nodes; i++) {
		color.push_back(i);
		graphVect.push_back(vector<int>());
	}
	// Creates graph
	while (infile >> arc.first) {
		infile >> arc.second;
		infile >> element.first;
		element.second = arc;
		graph.push_back(element);
		original.push_back(element);
	}
	// Arcs with lowest cost - first
	sort(graph.begin(), graph.end());
	infile.close();
}

bool cycleSearch(int node, vector<int> &colorDfs, vector<int> &parents)
{
	// grey
	colorDfs[node] = 1;
	int to = 0;
	for (vector<int>::iterator i = graphVect[node].begin(); i != graphVect[node].end(); i++) {
		to = *i;
		// if white
		if (colorDfs[to] == 0) {
			parents[to] = node;
			if (cycleSearch(to, colorDfs, parents)) 
				return true;
		}
		// if grey
		else if ((colorDfs[to] == 1) && (parents[node] != to)) {
			cycle_end = node;
			cycle_start = to;
			return true;
		}
	}
	// black
	colorDfs[node] = 2;
	return false;
}

int findCost(int start, int end) {
	int a, b;
	for (vector<pair<int, pair<int, int>>>::iterator i = graph.begin(); i != graph.end(); i++) {
		a = i->second.first;
		b = i->second.second;
		if ((a == start && b == end) || (b == start && a == end)) {
			return i->first;
		}
	}
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
	int lastAcceptedCost = 0;
	
	readFile(fInName, nodes, edges);
	
	for (vector<pair<int, pair<int, int>>>::iterator i = graph.begin(); i != graph.end(); i++) {
		start = i->second.first;
		end = i->second.second;
		cost = i->first;
		if (cost <= lastAcceptedCost) {
			alternative.insert(i->second);
		}
		if (color[start] != color[end]) {
			weight += cost;
			lastAcceptedCost = cost;
			result.insert(i->second);
			alternative.insert(i->second);
			graphVect[i->second.first].push_back(i->second.second);
			graphVect[i->second.second].push_back(i->second.first);
			int prevVal = color[end];
			int newVal = color[start];
			for (int j = 1; j <= nodes; j++) {
				if (color[j] == prevVal) {
					color[j] = newVal;
				}
			}
		}
	}

	ofstream outfile(fOutName);
	
	for (vector<pair<int, pair<int, int>>>::iterator i = original.begin(); i != original.end(); i++) {
		if (alternative.find(i->second) != alternative.end()) {
			outfile << "YES\n";
		}
		else {
			outfile << "NO\n";
			/*
			int answer = false;
			vector<int> colorDfs(nodes + 1, 0);
			vector<int> parentDfs(nodes + 1, 0);
			int a = i->second.first;
			int b = i->second.second;
			graphVect[a].push_back(b);
			graphVect[b].push_back(a);
			cycleSearch(a, colorDfs, parentDfs);
			int currentCost = i->first;
			int parent = 0;
			for (int j = cycle_end; j != cycle_start; ) {
				parent = parentDfs[j];
				if ((a != j && b != parent) || (b != j && a != parent)) {
					int localCost = findCost(j, parent);
					if (localCost == currentCost) {
						answer = true;
						break;
					}
					j = parent;
				}
			}
			graphVect[a].pop_back();
			graphVect[b].pop_back();
			if (answer) {
				outfile << "YES\n";
			}
			else {
				outfile << "NO\n";
			}*/
		}
	}
	outfile.close();

	return 0;
}