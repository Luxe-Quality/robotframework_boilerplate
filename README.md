Robot Framework - Quick Guide
====================================================================

![](https://testmatick.com/wp-content/uploads/2021/04/Robot-framework.png)

CRobot Framework is an open-source test automation environment for acceptance testing and development based on acceptance testing. Different styles of test sets are used for writing test cases - keyword-driven, behavior-driven, and data-driven. Robot Framework provides support for external libraries, and open-source tools that can be used for automation. The most popular library is the Selenium Library, used for web development and user interface testing.

Test cases are written using the style of keywords in a tabular format. You can use any text editor or Robot Integrated Development Environment (RIDE) to write test cases.

The robot framework works perfectly on all available operating systems. The framework is built on Python

[![Robot Framework Python](https://img.youtube.com/vi/4FXbqM3TKMs/0.jpg)](https://www.youtube.com/watch?v=4FXbqM3TKMs)


Features of the Robot Framework
===============================
In this section, we will look at the various functions offered by the robot.

Tabular format for test cases
=============================
The robot framework comes with a simple tabular format in which test examples are written using keywords. It is easy for a new developer to understand and write control examples.

Keywords
========
The Robot framework comes with built-in keywords available in the robot framework, keywords available from libraries such as the Selenium Library (open browser, closed browser, unfold browser, etc.). We can also create custom keywords that are a combination of other custom keywords or built-in or library keywords. We can also pass arguments to these keywords, which make custom keywords look like reusable functions.

Variable
========
The robot framework supports variables - scalar, list and dict. Variables in the robot environment are easy to use and very helpful when writing complex test cases.

Libraries
=========
The Robot framework supports many external libraries, such as SeleniumLibrary, Database Library, FTP Library and http library. SeleniumLibrary is mainly used because it helps to interact with browsers and helps in web application and user interface testing. Robot Framework also has its own built-in libraries for terms, dates, numbers, etc.

Resources
=========
Robot Framework also allows you to import robot files with keywords from outside for use in test examples. The resources are very easy to use and very useful when we need to use some keywords already written for other test projects.

Data driven tests
=================
The Robot framework supports test examples in the style of keywords and the style of data. Data management works with a high-level keyword, which is used as a template for the test suite, and benchmarks are used to exchange data with the high-level keyword defined in the template. This facilitates the work of testing the user interface with different inputs.

Test example label
==================
The robot framework allows you to tag test sets so that we can either run tagged test sets or skip tagged test sets. The tag helps when we want to run only a group of test cases or skip them.

Reports and journals
====================
The framework of the robot provides all the details of the set of tests, execution of test examples in the form of reports and logs. All the details of the test case execution are available in the log file. Detailed information is provided, for example, whether the test was passed or failed, the time taken to complete it, and the steps required to run the test.

Advantages of the Robot Framework
=================================
The robot framework is open source, so anyone who wants to try it can easily do so.

    * It is very easy to install and helps in creating and executing test cases. Any beginner can easily understand and does not need any high-level testing knowledge to start working with the robot framework.

    * It supports keyword-driven, behavior-driven, and data-driven style of writing test cases.

    * This is good support for external libraries. The Selenium library is most often used, which is easy to install and use in a robot environment.


Robot Framework Limitations
===========================
The work lacks nested if-else loops, which are necessary when the code becomes complex


Install Python and setup the environment
====================================================================

Install python
==============
To install python, go to the official python website - https://www.python.org/downloads/ and download the latest version or the previous version of python according to your operating system (Windows, Linux / Unix, Mac and OS X) you are going to to use

![](https://i.imgur.com/3rrYXXa.png)

Select a Python interpreter in VC
================================
Python is an interpreted language. Thus, in order to run Python code and get Python IntelliSense, you must tell VS Code which interpreter to use.
From within VS Code, select a Python 3 interpreter by opening the Command Palette **(Ctrl+Shift+P)**, start typing the **Python: Select Interpreter** command to search, then select the command. You can also use the Select Python Environment option on the Status Bar if available (it may already show a selected interpreter, too):

![](https://i.imgur.com/wbtWxQq.png)

The command presents a list of available interpreters that VS Code can find automatically, including virtual environments.

![](https://i.imgur.com/OtAe8iD.png)

After that create a simple file **main.py** and setup venv

.. code-block:: python

    msg = "Hello World"
    print(msg)

A best practice among Python developers is to avoid installing packages into a global interpreter environment. You instead use a project-specific *virtual environment* that contains a copy of a global interpreter. Once you activate that environment, any packages you then install are isolated from other environments. Such isolation reduces many complications that can arise from conflicting package versions. To create a virtual environment and install the required packages, enter the following commands as appropriate for your operating system:

.. tip:: Note: For additional information about virtual environments, see Environments. https://code.visualstudio.com/docs/python/environments#_creating-environments

Create a virtual environment using the Create Environment command
================================================================
From within VS Code, you can create non-global environments, using Venv or Anaconda, by opening the Command Palette **(Ctrl+Shift+P)**, start typing the **Python: Create Environment** command to search, and then select the command. You can also trigger the **Python: Create Environment** command through the Getting Started with Python page.
The command presents a list of environment types, Venv or Conda. For this example, select Venv.

![](https://i.imgur.com/CYdSFli.png)

The command then presents a list of interpreters that can be used for your project.

![](https://i.imgur.com/EW2tR22.png)

After selecting the desired interpreter, a notification will show the progress of the environment creation and the environment folder will appear in your workspace.
Remember after that restart your terminal from VC and we can see activated venv

![](https://i.imgur.com/fvOyzXj.png)


Installing Robot Framework
====================================================================
The easiest way to use pip is by letting it find and download packages it installs from the Python Package Index (PyPI), but it can also install packages downloaded from the PyPI separately. The most common usages are shown below and pip documentation has more information and examples.

.. code-block:: bash

    $ pip install selenium
    $ pip install robotframework
    $ pip install robotframework-seleniumlibrary


TestCase
====================================================================

code for file TC1.robot

.. code-block:: robotframework

    *** Settings ***
    Library			SeleniumLibrary
    Suite Setup		Navigate to site
    Suite Teardown	Close All Browsers


    *** Variables ***
    ${FIRST_NAME}   John
    ${LAST_NAME}    Doe
    ${EMAIL}    someemail@mail.com
    ${PASSWORD}    123456


    *** Test Cases ***
    LoginTest
        Click Element    css=.nav.float-end .dropdown
        Click Link    css=a[href*="register"]
        Set values in form    ${FIRST_NAME}    ${LAST_NAME}    ${EMAIL}    ${PASSWORD}
        Click Element    css=input[name="agree"]
        Click Button    css=[type="submit"]
        Sleep    3s    # Pauses for 5 seconds


    *** Keywords ***
    Navigate to site
        Open Browser	https://demo.opencart.com/		Chrome    executable_path=../drivers/chromedriver.exe


    Set values in form
        [Arguments]		${FIRST_NAME}	${LAST_NAME}    ${EMAIL}	${PASSWORD}
        Input Text    css=input[name="firstname"]    ${FIRST_NAME}
        Input Text    css=input[name="lastname"]    ${LAST_NAME}
        Input Text    css=input[name="email"]    ${EMAIL}
        Input Text    css=input[name="password"]    ${PASSWORD}


SeleniumLibrary is a web testing library for Robot Framework.
====================================================================

This document explains how to use keywords provided by SeleniumLibrary. For information about installation, support, and more, please visit the project pages. For more information about Robot Framework, see http://robotframework.org.

SeleniumLibrary uses the Selenium WebDriver modules internally to control a web browser. See http://seleniumhq.org for more information about Selenium in general and SeleniumLibrary README.rst Browser drivers chapter for more details about WebDriver binary installation.

    * Locating elements
    * Browser and Window
    * Timeouts, waits, and delays
    * Run-on-failure functionality
    * Boolean arguments
    * EventFiringWebDriver
    * Thread support
    * Plugins
    * Importing
    * Keywords

Locating elements
=================

All keywords in SeleniumLibrary that need to interact with an element on a web page take an argument typically named locator that specifies how to find the element. Most often the locator is given as a string using the locator syntax described below, but using WebElements is possible too.

Locator syntax
----------------------------

SeleniumLibrary supports finding elements based on different strategies such as the element id, XPath expressions, or CSS selectors. The strategy can either be explicitly specified with a prefix or the strategy can be implicit.


Browser and Window
==================

There is different conceptual meaning when SeleniumLibrary talks about windows or browsers. This chapter explains those differences.

Browser
----------------------------

When Open Browser or Create WebDriver keyword is called, it will create a new Selenium WebDriver instance by using the Selenium WebDriver API. In SeleniumLibrary terms, a new browser is created. It is possible to start multiple independent browsers (Selenium Webdriver instances) at the same time, by calling Open Browser or Create WebDriver multiple times. These browsers are usually independent of each other and do not share data like cookies, sessions or profiles. Typically when the browser starts, it creates a single window which is shown to the user.

Window
----------------------------

Windows are the part of a browser that loads the web site and presents it to the user. All content of the site is the content of the window. Windows are children of a browser. In SeleniumLibrary browser is a synonym for WebDriver instance. One browser may have multiple windows. Windows can appear as tabs, as separate windows or pop-ups with different position and size. Windows belonging to the same browser typically share the sessions detail, like cookies. If there is a need to separate sessions detail, example login with two different users, two browsers (Selenium WebDriver instances) must be created. New windows can be opened example by the application under test or by example Execute Javascript keyword.

Timeouts, waits, and delays
===========================

This section discusses different ways how to wait for elements to appear on web pages and to slow down execution speed otherwise. It also explains the time format that can be used when setting various timeouts, waits, and delays.


Timeout
----------------------------

SeleniumLibrary contains various keywords that have an optional timeout argument that specifies how long these keywords should wait for certain events or actions. These keywords include, for example, Wait ... keywords and keywords related to alerts. Additionally Execute Async Javascript. Although it does not have timeout, argument, uses a timeout to define how long asynchronous JavaScript can run.
The default timeout these keywords use can be set globally either by using the Set Selenium Timeout keyword or with the timeout argument when importing the library.


Implicit wait
----------------------------

Implicit wait specifies the maximum time how long Selenium waits when searching for elements. It can be set by using the Set Selenium Implicit Wait keyword or with the implicit_wait argument when importing the library. See Selenium documentation for more information about this functionality.


Selenium speed
----------------------------

Selenium execution speed can be slowed down globally by using Set Selenium speed keyword. This functionality is designed to be used for demonstrating or debugging purposes. Using it to make sure that elements appear on a page is not a good idea. The above-explained timeouts and waits should be used instead.


Time format
----------------------------

All timeouts and waits can be given as numbers considered seconds (e.g. 0.5 or 42) or in Robot Framework's time syntax (e.g. 1.5 seconds or 1 min 30 s). For more information about the time syntax see the Robot Framework User Guide.

Run-on-failure functionality
============================

SeleniumLibrary has a handy feature that it can automatically execute a keyword if any of its own keywords fails. By default, it uses the Capture Page Screenshot keyword, but this can be changed either by using the Register Keyword To Run On Failure keyword or with the run_on_failure argument when importing the library. It is possible to use any keyword from any imported library or resource file.
The run-on-failure functionality can be disabled by using a special value NOTHING or anything considered false (see Boolean arguments) such as NONE.

Boolean arguments
=================

Starting from 5.0 SeleniumLibrary relies on Robot Framework to perform the boolean conversion based on keyword arguments type hint. More details in Robot Framework user guide
Please note SeleniumLibrary 3 and 4 did have own custom methods to covert arguments to boolean values.

EventFiringWebDriver
====================

The SeleniumLibrary offers support for EventFiringWebDriver. See the Selenium and SeleniumLibrary EventFiringWebDriver support documentation for further details.

Thread support
==============

SeleniumLibrary is not thread-safe. This is mainly due because the underlying Selenium tool is not thread-safe within one browser/driver instance. Because of the limitation in the Selenium side, the keywords or the API provided by the SeleniumLibrary is not thread-safe.

Plugins
=======

SeleniumLibrary offers plugins as a way to modify and add library keywords and modify some of the internal functionality without creating a new library or hacking the source code. See plugin API documentation for further details.

Importing
=========

In Robot Framework, you can import libraries or resource files using the Library and Resource keywords.

Keywords
========

In Robot Framework, a keyword is a user-defined action or step that can be reused in multiple test cases. Keywords can be defined using the Keyword keyword and can be called from other keywords or directly from test cases.

Run Test
========

To run tests in Robot Framework, you can use the robot command-line tool. Here are the basic steps:
    * Open a terminal or command prompt window.
    * Navigate to the directory where your Robot Framework test suite file (.robot file) is located.
    * Run the robot command followed by the path to your test suite file. For example:

.. code-block:: bash

    robot path/to/your/test/suite.robot

You can also specify other options, such as the output directory, output file name, and test tags. For example:

.. code-block:: bash

    robot -d results -o output.xml -v MY_VAR:value --include smoke  ath/to/your/test/suite.robot

This command will run the test suite file located at **path/to/your/test/suite.robot**, store the results in the results directory, save the output file as output.xml, set a variable named MY_VAR to the value value, and run only the test cases with the smoke tag.
Wait for the tests to run. Robot Framework will execute your test cases and log the results to the console and output files.
Overall, running tests in Robot Framework is a straightforward process that can be customized using various command-line options. By default, Robot Framework will run all test cases in the specified test suite file, but you can also select a subset of test cases using tags or other criteria.

Report
====================================================================

![](https://robotframework.org/robotframework/latest/images/screenshots.png)

Robot Framework provides several built-in report formats that you can use to view and analyze your test results, including HTML, XML, JUnit, and TAP.
Overall, generating reports in Robot Framework is a useful way to analyze your test results and identify issues or trends. You can choose from several built-in report formats, or create your own custom reports using the --report and --reporttitle options.

Usage
=====

## Manual steps:
### 1. Install environment:

```bash
run: |
  python -m pip install --upgrade pip
  pip install -r requirements.txt
```

### 2. Run all playwright tests:
reopen terminal and run:
```bash
python -m robot -d reports/ tests/
```