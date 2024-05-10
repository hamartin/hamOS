# hamOS
A personal project to learn how to make a small operating system

This is a project for me to learn how to boot an "operating system" and do
something with it. What I will do with it, is unknown right now. My goal is
simply to be able to boot something using a bootloader and have an
understanding of the whole process. Depending on how interesting and how much I
understand the process, the goal of this project might change as time go by.

I suspect that in the beginning, there will be a lot of copy paste from the
projects and youtube videos I refer to in the resources.

The project will also be overly verbose in terms of comments. I do this so that
I can use the project as a referance later when and if I choose to do similar
projects.


## Tools 
  - nasm
    - We need an assembler to convert the assembly code into machine code.
  - dosfstools
    - I am doing this project os MacOS, and I need mkfs.fat to create the image
      which we run in the emulator.
  - mcopy
    - Lets us copy files directly into an image. Usefull when we want to copy
      the kernel and any other file we might need at build time.
  - qemu
    - A generic machine emulator and virtualizer. This is the tool I chose to
      run the operating system I am creating in this project.
    - It is possible to swap qemu out with something like bochs. Bochs can be
      used for the same things we use qemu for, but can also work as a
      debugger. I never managed to get the debugger working on MacOS because of
      dependencies and other errors I couldn't resolve, so I chose to go with
      qemu as I found it easier to work with.
  - make
    - A tool to help maintain the project. I don't know the full extent of what
      make can do, but for our purposes, it is simply a way for us to build the
      binaries and images, and help with repetetive tasks.
  

# Resources
If a website, youtube video, git repository has been usefull while learning and
creating my code. A reference to it will be found here.


## Youtube videos
  - [OliveStem](https://www.youtube.com/@olivestemlearning)
  - [nanobyte](https://www.youtube.com/@nanobyte-dev)


## Wikis
  - [X86 instruction
    listings](https://en.wikipedia.org/wiki/X86_instruction_listings)
  - [OSDEV FAT Wiki](https://wiki.osdev.org/FAT#Boot_Record)


## Github projects
  - [nanobyte_os](https://github.com/nanobyte-dev/nanobyte_os.git)


## PDF
  - [Writing a Simple Operating System from
    Scratch](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf).
    The PDF is an excellent resource. Read it and understand it.
