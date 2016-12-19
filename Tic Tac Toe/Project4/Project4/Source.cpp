#include <iostream>
using namespace std;

char box[10] = { '0','1','2','3','4','5','6','7','8','9' };

int checkwin() // This function is chechking each of the boxes of the table 
{					// and if the game is over or not
	if (box[1] == box[2] == box[3])
		return 1;
	else if (box[4] == box[5] && box[5] == box[6])
		return 1;
	else if (box[7] == box[8] && box[8] == box[9])
		return 1;
	else if (box[1] == box[4] && box[4] == box[7])
		return 1;
	else if (box[2] == box[5] && box[5] == box[8])
		return 1;
	else if (box[3] == box[6] && box[6] == box[9])
		return 1;
	else if (box[1] == box[5] && box[5] == box[9])
		return 1;
	else if (box[3] == box[5] && box[5] == box[7])
		return 1;
	else if (box[1] != '1' && box[2] != '2' && box[3] != '3' 
		&& box[4] != '4' && box[5] != '5' && box[6] != '6'
		&& box[7] != '7' && box[8] != '8' && box[9] != '9')
		return 0;
	else
		return -1;
};
void board() // This is the function for drawing the table in the console window and player marks
{
	system("cls");
	cout << "\n\n\tTic Tac Toe\n\n";
	cout << endl;

	cout << "     |     |     " << endl;
	cout << "  " << box[1] << "  |  " << box[2] << "  |  " << box[3] << endl;

	cout << "_____|_____|_____" << endl;
	cout << "     |     |     " << endl;

	cout << "  " << box[4] << "  |  " << box[5] << "  |  " << box[6] << endl;

	cout << "_____|_____|_____" << endl;
	cout << "     |     |     " << endl;

	cout << "  " << box[7] << "  |  " << box[8] << "  |  " << box[9] << endl;

	cout << "     |     |     " << endl << endl;
};

int main()
{
	int player = 1, i, choice;

	char mark;
	do
	{
		board();
		player = (player % 2) ? 1 : 2;

		cout << "Player" << player << ", enter a number:   ";
		cin >> choice;

		mark = (player == 1) ? 'X' : 'O';
		// putting X and Os in desired boxes and checking for any invalid moves made by the players
		if (choice == 1 && box[1] == '1')
			box[1] = mark;
		else if (choice == 2 && box[2] == '2')
			box[2] = mark;
		else if (choice == 3 && box[3] == '3')
			box[3] = mark;
		else if (choice == 4 && box[4] == '4')
			box[4] = mark;
		else if (choice == 5 && box[5] == '5')
			box[5] = mark;
		else if (choice == 6 && box[6] == '6')
			box[6] = mark;
		else if (choice == 7 && box[7] == '7')
			box[7] = mark;
		else if (choice == 8 && box[8] == '8')
			box[8] = mark;
		else if (choice == 9 && box[9] == '9')
			box[9] = mark;
		else {
			cout << "Invalid move";

			player--;
			cin.ignore();
			cin.get();
		}

		i = checkwin();

		player++;
	}

	while (i == -1);
	board();
	if (i == 1)
		cout << "==>\a	Player	" << --player << "	wins";
	else
		cout << "==>\aGame draw";
	cin.ignore();
	cin.get();
	return 0;
}