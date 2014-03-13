#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

void dfs(int node, vector<vector<int>> &graph, vector<bool> &color, vector<int> &way)
{
	// first output when in 
	way.push_back(node);
	color[node] = true;
	for (vector<int>::iterator i = graph[node].begin(); i != graph[node].end(); i++){
		if (!color[*i]) {
			dfs(*i, graph, color, way);
			way.push_back(node);
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

int main()
{
	string fInName = "step.in";
	string fOutName = "step.out";
	vector<vector<int>> graph;
	vector<bool> color;
	vector<int> way;
	int nodes = 0;
	int edges = 0;
	int start = 0;
	// Read
	ifstream infile(fInName);
	infile >> nodes;
	infile >> edges;
	infile >> start;
	// Init graph
	for (int i = 0; i <= nodes; i++) {
		color.push_back(0);
		graph.push_back(vector<int>());
	}
	int index = 0;
	int value = 0;
	// Adding edges
	while (infile >> index) {
		infile >> value;
		graph[index].push_back(value);
		graph[value].push_back(index);
	}
	infile.close();

	dfs(start, graph, color, way);
	
	writeFile(fOutName, way);
	return 0;
}