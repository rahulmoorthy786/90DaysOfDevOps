# Linux Fundamentals: Read and Write Text Files

`touch notes.txt`

Creates an empty text file notes.txt

`echo "My name is Rahul" > notes.txt`

Write the notes.txt file 

`echo "I'm a DevOps Engineer" >> notes.txt`   

The above commands append to the text file 

`echo "And I love to resolve the issue" | tee -a notes.txt`

tee -a appends the output to a file while also printing the same output on the screen at the same time.

`head -n 2 notes.txt`

Prints the first two lines. 

tail -n 2 notes.txt

Prints the last two lines. 

---
# Practice of the above commands.

<img width="721" height="423" alt="image" src="https://github.com/user-attachments/assets/e2845f2d-da38-4cb1-9c8c-1202f97a3f34" />

