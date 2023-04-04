%function enter
function enter = enter(f)
%creates empty array B
B=[];
%loops 5 times for 5 letters in a word
for k=1:5
    %sets input variable "z" to 0
    z=0;
    %sets isempty variable "abc" to 0
    abc=0;
    %a while loop that loops until all 3 conditions are met
    %checks if any inputs besides letters are typed
    %checks if any letters greater than 1 are typed
    %checks if an empty matrix is entered (e.g. space or enter)
    while ~all(isletter(z)) || length(z)>1 || abc>0
        %dialogue
        fprintf("Enter Letter %d", k);
        %input command
        z=input(": ", "s");
        %checks if input is an empty matrix
        abc=isempty(z);
    end
    %changes all inputs to lower case to be processed
    x=lower(z);
    %changes all inputs to uppercase to be displayed in the graphic
    y=upper(x);
    %creates the corresponding letter to the input based on variables
    %f and k
    text((1.6+2*k-2),(12-f),y,'FontSize',40,'FontWeight','bold','Color','white')
    %builds vector B (the players guess)
    B=[B x];
end

%sets the function to the players guess (array B)
enter = B;

end
