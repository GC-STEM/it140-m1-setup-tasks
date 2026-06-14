# Software Development Life Cycle To-Do List

**Course**: {{CS 000}} - {{Course Title}}
**Activity Title**: {{ModNum}}-{{ActNum}}: {{Full Activity Title}}
**Activity Name**: {{Activity-Name}}

## 0. Overview

{{TODO: Add a brief assignment-specific overview for the to-do list here.}}

## 1. Analysis Phase

Perform the following tasks to analyze the problem and understand the requirements for the program you will develop.

- [ ] 1.1. Read the [Software Requirement Specifications](./analysis/program_name_srs.md) (SRS) to understand the program's requirements.

- [ ] 1.2. Complete the **TBD** section of your [Development Worksheet](./program_name_wks.md) to understand the requirements for the program you will be developing.

- [ ] 1.3. Review the Sample Input/Output (I/O) file to understand the program's expected behavior.

- [ ] 1.4. Complete the **IPO** section of your [Development Worksheet](./program_name_wks.md) to understand the program's inputs, processing, and outputs.



## 2. Design Phase

### 2.1 Software Design Document (SDD)

Perform the following tasks to design the program that meets the SRS.

- [ ] 2.1. Read the [Software Design Document](./design/program_name_sdd.md) (SDD)

### 2.2 Flowchart

Create a flowchart that shows the mid-level logic of the {{Program-Name}} program based on your Software Design Document (SDD). Your flowchart should help another person understand how the program moves from inputs, through processing and decisions, to outputs. Your flowchart does not need to show every line of code. Instead, it should show the main steps, decision points, loops, and data movement needed to meet the program requirements.

- [ ] 2.2.0. Install support for Draw.io diagrams (`.drawio` files) in your IDE, if needed.
    - **VS Code | Open VSX**: Install the **Draw.io Integration** extension (hediet.vscode-drawio).
    - **JetBrains IDEs**: Install the **Diagrams.net Integration** plugin (de.docs_as_co.intellij.plugin.diagramsnet).

- [ ] 2.2.1. Open the [`program_name.drawio`](./design/program_name.drawio) file in your IDE.

- [ ] 2.2.2. Review the provided flowchart resources. Study the tabs in the program_name.drawio file before creating your own flowchart.
    - **Symbols**: Shows the flowchart symbols you may need.
    - **Snippets**: Shows small examples of common program logic, such as decisions and loops.
    - **Example**: Shows a completed flowchart for a different program.

- [ ] 2.2.3 Create the flowchart in the {{Program-Name}} tab. Add the symbols needed to show the program’s mid-level logic. Arrange the symbols in a clear order, aligned and evenly spaced. Include symbols for the major parts of your program, such as::
    - **Inputs and outputs**: {{TODO: Add needed input/output symbols here.}}
    - **Processes**: {{TODO: Add needed process symbols here.}}
    - **Decisions**: {{TODO: Add needed decision symbols here.}}
    - **Loops**: {{TODO: Add needed loop symbols here.}}
    - **Start and end points**: {{TODO: Add needed start/end symbols here.}}

- [ ] 2.2.4. Connect the flowchart symbols. Add connector lines to show the order in which the program steps happen.
    - Use a solid line with an arrowhead to show the flow from one symbol to the next.
    - Label each decision branch with the condition that controls that path, such as Yes, No, True, or False.
    - Make sure every decision has a clear path for each possible outcome.
    - Use a dashed line without an arrowhead only when connecting an annotation to a symbol.

- [ ] 2.2.5. Check the flowchart against the SDD. Compare your flowchart to the SDD to make sure the flowchart includes the required functionality. Ask yourself:
    - Does the flowchart show the required inputs?
    - Does it show the main processing steps?
    - Does it show the required decisions and paths?
    - Does it show the expected outputs?
    - Does each major requirement from the SDD appear somewhere in the flowchart?

- [ ] 2.2.6. Trace test cases through the flowchart. Mentally trace at least one test case per path through the flowchart. Start with sample inputs, follow the arrows, and check whether the flowchart reaches the expected outputs. Revise the flowchart if a test case gets stuck, skips a required step, follows an unclear path, or produces the wrong result.

### 2.3 Pseudocode

Create pseudocode that expands the logic from your flowchart into low-level, step-by-step instructions. Your pseudocode is the final design step before writing the source code for the `{{Program-Name}}` program. Your pseudocode should not use exact Python syntax. Instead, it should describe the program logic clearly enough that you can use it as a guide when you begin coding.

- [ ] 2.3.1. Open the [`program_name.pseudo`](./design/program_name.pseudo) file in your IDE.

- [ ] 2.3.2. Review your flowchart and SDD. Use your flowchart and Software Design Document (SDD) as the source for your pseudocode. Before writing, identify the main parts of the program as comments in the pseudocode file. For example, you might identify:

    - Inputs the program needs
    - Values the program must store or update
    - Processing steps the program must perform
    - Decisions the program must make
    - Loops the program must repeat, if any
    - Outputs the program must display or save

- [ ] 2.3.3. Write the pseudocode in a logical order. Expand each major flowchart symbol into one or more clear pseudocode steps. Write the steps in the order the program should follow, from start to finish. Include enough detail that another person could understand what the program should do before reading the code.

* [ ] 2.3.4. Show inputs, outputs, and stored values.**

  Include pseudocode steps for the data your program uses.

  Your pseudocode should show:

  * When the program gets input from the user or another source
  * What values need to be stored
  * When values are updated or calculated
  * When the program displays or returns output

* [ ] **2.3.4. Show decisions clearly.**

  Write each decision so the condition is easy to understand.

  For each decision, show what happens when the condition is true and what happens when the condition is false.

  Use clear wording such as:

  ```text
  IF condition is true THEN
      Do these steps
  ELSE
      Do these other steps
  END IF
  ```

* [ ] **2.3.5. Show loops clearly, if needed.**

  If your program repeats steps, write the loop condition and the steps that repeat.

  Make sure the pseudocode shows:

  * When the loop starts
  * What condition controls the loop
  * What steps happen inside the loop
  * How the loop eventually ends

  Use clear wording such as:

  ```text
  WHILE condition is true
      Do these steps
      Update the value that controls the loop
  END WHILE
  ```

* [ ] **2.3.6. Keep the pseudocode readable.**

  Use plain language and consistent indentation to show structure.

  Your pseudocode should be:

  * Clear
  * Specific
  * Ordered
  * Easy to trace
  * More detailed than the flowchart
  * Less strict than source code

* [ ] **2.3.7. Check the pseudocode against the flowchart.**

  Compare your pseudocode to your flowchart.

  Make sure every major flowchart step appears in the pseudocode, including:

  * Inputs
  * Processes
  * Decisions
  * Loops, if any
  * Outputs
  * Start and end logic

* [ ] **2.3.8. Trace positive test cases through the pseudocode.**

  Use the positive test cases from the requirements document to check your pseudocode.

  Trace at least one positive test case for each major path in the logic. For example, if a decision has a true path and a false path, trace one valid test case through each path.

  For each test case:

  * Start with the given input.
  * Follow the pseudocode step by step.
  * Check each calculation, decision, and output.
  * Confirm that the pseudocode produces the expected result.

  Revise the pseudocode if a test case gets stuck, skips a required step, follows an unclear path, or produces the wrong result.


## 3. Construction Phase

In the [`src\program_name.py`](./src/program_name.py) file, perform the following tasks to implement the program according to the SDD, flowchart, and pseudocode.

- [ ] 3.1. Use block comments{{ and function definitions}} to outline code functionality based on the flowchart. Describe the purpose of each block of code in one full sentence.

- [ ] 3.2. Write code for one functional block based on pseudocode

- [ ] 3.3. Test and debug code using test cases for that functionality

- [ ] 3.4. Repeat steps 3.2 and 3.3 until all functionalities work as desired

- [ ] 3.5. Document your code with clear comments and meaningful variable and function names to make it easy to read and maintain.

## 4. Testing Phase

In the `tests\test_program_name.py` file, perform the following tasks to test the program to ensure it meets the requirements outlined in the SRS.

### 4.1. Alpha Testing

### 4.2. Beta Testing

- [ ] Test your program by {{submitting to the Instant Feedback Tool | running the provided test cases | pushing to the repository}} to verify that your program meets all the functional and nonfunctional requirements.

- [ ] Correct one error at a time, testing after each correction to ensure the program is working as expected

- [ ] Continue until all errors are resolved and the program is working as expected

### 4.3. Self-Checks

- [ ] Correct any issues identified by your IDE's linter and code analysis tools

- [ ] Compare your program against the [Acceptance Criteria Checklist](./tests/acceptance.md) (ACC) to verify that your program meets all nonfunctional requirements.

- [ ] Self-check program against the assignment rubric to ensure all criteria are met

### 4.4. Submit deliverables

Submit the following files as one submission to the assignment drop box in D2L Brightspace before the due date for acceptance testing (i.e., instructor grading and feedback).

- [ ] flowchart.drawio
- [ ] program_name.pseudo
- [ ] program_name.py
- [ ] document_name.md

## 5. Maintenance Phase (Optional)

In our SDLC, the Maintenance Phase is performed after your instructor has graded your program and provided feedback. This phase is an opportunity (not a requirement) to correct any issues they identified, as well as to make improvements to the program based on that feedback. The Maintenance Phase can be broken down into three types: corrective, perfective, and adaptive.

### 5.1 Corrective Maintenance

- [ ] Review instructor feedback and identify any issues or bugs in the program
- [ ] Repeat Phases 3 and 4 to correct one issue at a time to ensure each change works as expected
- [ ] Continue until all issues are resolved and the program is working as expected
- [ ] If permitted, resubmit the corrected program for instructor's feedback

### 5.2 Perfective Maintenance

- [ ] TODO

### 5.3 Adaptive Maintenance

- [ ] TODO
