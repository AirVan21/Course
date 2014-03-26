#pragma comment(linker, "/STACK:16777216")
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <queue>


using namespace std;

// global variables
int timer = 0;
vector<int> timeIn;
vector<int> decisionTime;
vector<vector<int>> graph;

void readFile(const string &fInName, int &nodes, int &edges, vector<bool> &color)
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
		graph[value].push_back(index);
	}
	infile.close();
}

void writeFile(string fOutName, vector<int> &way){
	ofstream outfile(fOutName);
	outfile << way.size() << "\n";
	sort(way.begin(), way.end());
	for (int i = 0; i < way.size(); i++) {
		outfile << way[i] << "\n";
	}
	outfile.close();
}

void cutSearch(int place, int parent, vector<bool> &color, vector<int> &points)
{
	color[place] = true;
	int childCounter = 0;
	timer++;
	decisionTime[place] = timer;
	timeIn[place] = timer;
	for (vector<int>::iterator i = graph[place].begin(); i != graph[place].end(); i++) {
		// Strange case
		if (*i == parent)
			continue;
		// For back edge
		if (color[*i]) {
			decisionTime[place] = min(decisionTime[place], timeIn[*i]);
		}
		else {
			// Search sons, which wasn't visited
			cutSearch(*i, place, color, points);
			// Should be min in son's decision time
			decisionTime[place] = min(decisionTime[place], decisionTime[*i]);
			if (decisionTime[*i] >= timeIn[place] && parent != -1) {
				// Is a cutpoint
				int exist = false;
				for (int j = 0; j < points.size(); j++) {
					if (points[j] == place) {
						exist = true;
					}
				}
				if (!exist) {
					points.push_back(place);
				}
			}
			childCounter++;
		}
		// special 
		if (parent == -1 && childCounter > 1) {
			int exist = false;
			for (int j = 0; j < points.size(); j++) {
				if (points[j] == place) {
					exist = true;
				}
			}
			if (!exist) {
				points.push_back(place);
			}
		}
	}
}

int main()
{
	string fInName = "points.in";
	string fOutName = "points.out";
	vector<bool> color;
	vector<int> points;
	int nodes = 0;
	int edges = 0;
	readFile(fInName, nodes, edges, color);
	for (int i = 0; i <= nodes; i++) {
		timeIn.push_back(0);
		decisionTime.push_back(0);
	}
	// Choose first node as a root
	int root = 1;

	cutSearch(root, -1, color, points);
	writeFile(fOutName, points);

	return 0;
}