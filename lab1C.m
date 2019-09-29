load('ELE532_Lab1_Data.mat');

% Copy the data array x_audio into audio.
audio = x_audio;

num_rows = size(audio,1);
num_cols = size(audio, 2);

number_of_zeros = 0;

for i = 1: num_rows
    for j = 1: num_cols
        if(abs(audio(i,j) == 0))
            number_of_zeros = number_of_zeros + 1;
        end
    end
end

% How many elements are zero in the 
fprintf("\n" + number_of_zeros);

% Now play the sound.
sound(audio,8000)