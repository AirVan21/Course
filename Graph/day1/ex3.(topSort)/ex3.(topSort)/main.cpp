#pragma comment(linker, "/STACK:16777216")
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <queue>



using namespace std;

void readFile(const string &fInName, int &nodes, int &edges, vector<vector<int>> &graph, vector<bool> &color)
{
	int value = 0;
	int index = 0;
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	// Init
	for (int i = 0; i <= nodes; i++) {
		color.push_back(0);
		graph.push_back(vector<int>());
	}
	// Create oriented graph
	while (infile >> index) {
		infile >> value;
		graph[index].push_back(value);
	}
	infile.close();
}

void writeFile(string fOutName, vector<int> &way){
	ofstream outfile(fOutName);
	for (int i = 0; i < way.size(); i++) {
		outfile << way[i] << " ";
	}
	outfile.close();
}

void dfs(int node, vector<vector<int>> &graph, vector<bool> &color, vector<int> &way)
{
	color[node] = true;
	for (vector<int>::iterator i = graph[node].begin(); i != graph[node].end(); i++) {
		if (!color[*i]) {
			dfs(*i, graph, color, way);
		}
	}
	// Nodes with less indexes will be added to the end
	way.push_back(node);
}

void topSort(int nodes, vector<vector<int>> &graph, vector<bool> &color, vector<int> &way) {
	// Deal with graph coherence
	for (int i = 1; i <= nodes; i++) {
		if (!color[i]) {
			dfs(i, graph, color, way);
		}
	}
	// Now nodes with less indexes will be added to the start
	reverse(way.begin(), way.end());
}

void isCyclic(int node, vector<vector<int>> &graph, vector<int> &colorTest, bool &answerTest)
{
	// Grey color
	colorTest[node] = 1;
	for (vector<int>::iterator i = graph[node].begin(); i != graph[node].end(); i++) {
		if (colorTest[*i] != 2) {
			if (colorTest[*i] == 0) {
				isCyclic(*i, graph, colorTest, answerTest);
			}
			else {
				answerTest = true;
			}
		}
	}
	// Black color
	colorTest[node] = 2;
}

int main()
{
	string fInName = "topsort.in";
	string fOutName = "topsort.out";
	vector<vector<int>> graph;
	vector<bool> color;
	vector<int> colorTest;
	vector<int> way;
	bool answerTest = false;
	int nodes = 0;
	int edges = 0;
	readFile(fInName, nodes, edges, graph, color);
	// Test is graph Cyclic or not
	for (int i = 0; i <= nodes; i++) {
		colorTest.push_back(0);
	}
	for (int i = 1; i <= nodes; i++) {
		isCyclic(i, graph, colorTest, answerTest);
	}
	// makes topSort if graph is Acyclic
	if (answerTest) {
		ofstream outfile(fOutName);
		outfile << -1;
		outfile.close();
	}
	else {
		topSort(nodes, graph, color, way);
		writeFile(fOutName, way);
	}
	
	return 0;
}