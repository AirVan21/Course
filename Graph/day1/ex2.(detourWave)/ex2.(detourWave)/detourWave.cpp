#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <queue>

using namespace std;

void readFile(const string &fInName, int &nodes, int &edges, int &start, vector<vector<int>> &graph, vector<bool> &color)
{
	int value = 0;
	int index = 0;
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	infile >> start;
	// Init
	for (int i = 0; i <= nodes; i++) {
		color.push_back(0);
		graph.push_back(vector<int>());
	}
	// Create graph
	while (infile >> index) {
		infile >> value;
		graph[index].push_back(value);
		graph[value].push_back(index);
	}
	infile.close();
}

void bfs(int &start, vector<vector<int>> &graph, vector<bool> &color, vector<int> &metric)
{
	color[start] = true;
	queue<int> fireQueue;
	fireQueue.push(start);
	metric.push_back(start);
	while (!fireQueue.empty()) {
		int top = fireQueue.front();
		fireQueue.pop();
		for (vector<int>::iterator i = graph[top].begin(); i != graph[top].end(); i++) {
			if (!color[*i]) {
				fireQueue.push(*i);
				color[*i] = true;
				metric.push_back(*i);
			}
		}
	}
}

void writeFile(string fOutName, vector<int> &way){
	ofstream outfile(fOutName);
	int size = way.size();
	outfile << size << endl;
	for (int i = 0; i < size; i++) {
		outfile << way[i] << " ";
	}
	outfile.close();
}


int main() {
	string fInName = "wave.in";
	string fOutName = "wave.out";
	vector<vector<int>> graph;
	vector<bool> color;
	vector<int> metriñ;
	int nodes = 0;
	int edges = 0;
	int start = 0;
	readFile(fInName, nodes, edges, start, graph, color);
	bfs(start, graph, color, metriñ);
	writeFile(fOutName, metriñ);
	return 0;
}