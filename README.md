# vaccine-web-tests
**Question1 :** How to run your tests.<br />
**Answer:**
1. Use the package manager [pip](https://pip.pypa.io/en/stable/) to install robotframework in requirement.txt

    ```bash
    pip install -r requirements.txt
    ```
2. Access to a command-line/terminal window and change directory to the directory that contain `vaccine-web-tests` folder.
    ```
    cmd> cd vaccine-web-tests
    ```
3. Run tests by using this command line
    ```
    cmd> robot test_vaccine_web.robot
    ```

**Question2 :** Which do you think is a better framework for E2E testing of web applications or web services:  Robot Framework or Cucumber with Selenium/HTTP library and JUnit?<br />
**Answer:** Cucumber with Selenium/HTTP library and JUnit because cucumber has more user-friendly Gherkin syntax and simplicity, so it's easier to work with.

**Question3 :** What tutorial or online resource(s) did you find most helpful for learning Robot Framework?<br />
**Answer:**
* https://robotframework.org/Selenium2Library/Selenium2Library.html#Page%20Should%20Contain 
* https://www.edureka.co/blog/robot-framework-tutorial/