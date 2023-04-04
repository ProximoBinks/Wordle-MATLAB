%final iteration of code
%27/4
%wordle rev 7

clear all;
clc;
%closes all existing figure windows
close all;

%adds the following properties to the figure window
hFigure = figure('Name',"Wordle - The New York Times",'NumberTitle','off' ...
    ,"Color",'#121213');
%remove the following properties from the code
set(hFigure, 'MenuBar', 'none');
%removes the menubar
set(hFigure, 'ToolBar', 'none');
%removes the toolbar

%forces resolution and position of window to ensure graphics
%are in the same position every time the program is run
set(gcf, 'Position',  [960, 0, 960, 1050])

%calls function readDictionary which takes the text file
%dictionary.txt and splits the text into the array 'words'
dict=readDictionary('dictionary.txt'); % read dictionary

%chooses a random word from list from variable dict
word=randperm(length(dict),1);
%assigns the random word to the variable A
A = dict{word};

%turn on for troubleshooting when you need to know the
%chosen random word

disp(A);

%turns the axis off the figure
axis off
%forces the coordinates to be square
axis square

%return current axis
ax = gca;
%set title and subtitle properties for the figure
ax.Title.String = 'Wordle';
ax.Title.Color = 'white';
ax.Title.FontWeight = 'bold';
ax.Title.FontSize = 50;
ax.Subtitle.String = 'The New York Times';
ax.Subtitle.FontWeight = 'bold';
ax.Subtitle.Color = 'white';
ax.Subtitle.FontSize = 20;

%creates array B to be used later
B=[];

%assigns variables e and f values to be used
%by the functions and code below
%e is the condition that the game ends or continues
e=0;
%f is the variable that records which line
%of wordle you are on
f=2;

%dialogue
fprintf("Please guess a 5 letter word!\n\n")

%assigns the axis values
axis([0 12 0 12])

%a loop that creates 25 individual squares
%that all have different coordinates
for l=[9 7 5 3 1]
    for m = [1 3 5 7 9]
        r(m,l)=rectangle('Position',[m l 1.8 1.8],'FaceColor','#121213', ...
            'EdgeColor','#3a3a3c','LineWidth',3);
    end
end

%conditional statement where if all 5 letters are
%not in the correct position in the wordle
%keep looping
while e<5
    %calls function enter which allows
    %inputs to be entered and recorded
    %it also displays its corresponding
    %letter that was inputted
    B=enter(f);
    %displays your guess
    fprintf("\nYOU GUESSED %s",B)
    %calls function colorchange which
    %changes the colour of each rectangle
    %based on the players input
    e=colorchange(A,B,f,r,e);
    %conditional statement that discusses
    %when all 5 letters are not in the
    %their correct positions, display
    %"you guessesd incorrectly"
    if e<5
        e=0;
        fprintf("\nYOU GUESSED INCORRECTLY! TRY AGAIN!")
    end
    %new lines
    fprintf('\n');
    fprintf('\n');
    %clear your first guess
    B=[];
    %adds 2 so that the coordinates for
    %the next line can be updated and the
    %player can continue on the next attempt
    f=f+2;
    %when all 5 letters are correct, display
    %win dialogue. The loop will also end at this
    %stage as first while loop will finish
    if e==5
        fprintf("YOU WIN!!!")
    end
    %when you reach the final attempt (last line)
    %it breaks out of the loop, ends the game
    %and displays what the final words was
    if f==12
        fprintf("YOU LOSE!!!")
        fprintf("\nThe word was: %s!",A)
        rectangle("Position",[5 11.05 1.8 0.8],"FaceColor","white","EdgeColor","none","Curvature",0.2)
        text(5.32,11.5,A,'FontSize',20,'FontWeight','bold','Color','black')
        break
    end
end

%prints a new line
fprintf('\n')
%dialogue
fprintf('\n< Press any key to continue >\n')
%waits for the player to see the results
%and continues when a key is pressed
pause
%closes all active figure windows
close all;