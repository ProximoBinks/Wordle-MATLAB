%function colorchange
function e=colorchange(A,B,f,r,e)

%defines variable e which determines how many letters
%you get correct each time
e=0;
    %for loop for 5 letters
    for i=1:5
        %variable 'word' checks if letter inputed
        %are contained in random word A
        word = strfind(A,B(i));
        %if the corresponding letter to B is in the same
        %exact spot as A, change colour of corresponding
        %square to green
        if B(i)==A(i)
            %fprintf("green")
            r(2*i-1, 11-f).FaceColor = '#538d4e';
            r(2*i-1, 11-f).EdgeColor = '#538d4e';
            %adds 1 to variable e
            e=e+1;
        %checks if the letter inputted appears
        %anywhere at all in A, then sets the
        %corresponding square to orange
        elseif word>0
            %fprintf("orange")
            r(2*i-1, 11-f).FaceColor = '#b59f3b';
            r(2*i-1, 11-f).EdgeColor = '#b59f3b';
        %if neither if statement is met above,
        %it means the letter is not contained at all
        %in the chosen random word, hence, it sets
        %the corresponding box to grey
        else
            %fprintf("grey")
            r(2*i-1, 11-f).FaceColor = '#3a3a3c';
            r(2*i-1, 11-f).EdgeColor = '#3a3a3c';
        end
    end
end