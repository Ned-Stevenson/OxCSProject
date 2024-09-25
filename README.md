# OxCSProject

**OxCSProject** is a LaTeX template for a part B or part C project for the department of Computer Science at the University of Oxford.

Feel free to submit issues or push requests here, and see the content of the template's PDF output for further details.

---

When writing my Part B project in 2024, I was lucky enough to find [a template that John McManigle had made](https://github.com/mcmanigle/OxThesis). He in turn had built on top of [a template that Sam Evans adapted](http://evansresearch.org/2010/05/oxford-thesis-latex-template/) for social sciences use based on [the original maths template by Keith Gillow](https://www.maths.ox.ac.uk/members/it/faqs/latex/thesis-class). I took John's template and adjusted it to be suitable for a shorter project report instead of the originally intended, much longer, thesis.  This template is distributed under an MIT License with each of their permissions.  It's also worth pointing out that [Danny Price has developed a LyX template](https://github.com/telegraphic/Oxford-LyX-Thesis-Template) based on the maths template as well.

Please see John's work to see where **OxCSProject** came from, and to explore some of the features that I cut out for simplicity, since I expect this is most user's first experience with LaTeX.

For installation instructions and further information, please navigate to [the PDF](Project.pdf) attached to this repo to read more.

---

Some of the features of **OxCSProject** are:

*Easy code display.* With the inevitable need of Computer Science projects to display code, I have included a package that allows for the inclusion of your project source code, reading directly from the file.

*Table of abbreviations.* It is likely that you will delve into a reasonable level of technical detail in your report. Given the density of (sometimes overlapping) acronyms and initialisms in Computer Science, you will be able to easily list those important terms.

*Easily configured title page.* Through the setting of a number of variables in obvious stages of the template's main `.tex` file, the title page can be easily set up to include all of the context for your particular project.

*Convenient todo notes.* You probably won't end up writing your whole project without leaving gaps and placeholders to return to at a later point. By making use of the `todo` package, you're able to easily keep a list of things that need to be changed at the top of your report, which can be hidden in the final product.
