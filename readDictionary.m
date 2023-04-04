function [ words ] = readDictionary(dictFile)
% reads a dictionary file in the same directory and 
% returns a vector of strings in words.
dictText=fileread(dictFile); % read in character arrays
dictWords=splitlines(dictText); % split the text array into words
dictWords=dictWords(1:end-1); % remove the last empty line

% build the dictionary from a text array
words=[]; % empty array
for i=[1:length(dictWords)]   
    % concatenate the string onto the end of the dictionary   
    words=[words string(dictWords(i))];
end
end