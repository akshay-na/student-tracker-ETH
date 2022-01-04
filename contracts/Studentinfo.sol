// SPDX-License-Identifier: MIT
pragma solidity >=0.4.17;

contract StudentInfo {
    struct Student {
        string Name;
        uint256 Age;
        string DOB;
        string Gender;
        string Club;
        string Course;
    }

    uint256 public counter;
    mapping(uint256 => Student) StudentDetails;

    function EnterStudentDetails(
        string memory name,
        uint256 age,
        string memory dob,
        string memory gender,
        string memory club,
        string memory course,
        address account
    ) public {
        require(msg.sender == account);
        StudentDetails[counter] = Student(name, age, dob, gender, club, course);
        counter++;
    }

    function RetriveStrudentFromSameCourse(string memory course)
        public
        view
        returns (uint256[] memory)
    {
        uint256 count;
        uint256 i = 0;
        for (i = 0; i < count + 1; i++) {
            if (
                keccak256(bytes(StudentDetails[i].Course)) ==
                keccak256(bytes(course))
            ) {
                count++;
            }
        }

        uint256[] memory result = new uint256[](count);
        uint256 j = 0;

        for (i = 0; i < count + 1; i++) {
            if (
                keccak256(bytes(StudentDetails[i].Course)) ==
                keccak256(bytes(course))
            ) {
                result[j] = i;
                j++;
            }
        }

        return result;
    }

    function RetriveName(uint256 id) public view returns (string memory) {
        return StudentDetails[id].Name;
    }

    function RetriveAge(uint256 id) public view returns (uint256) {
        return StudentDetails[id].Age;
    }

    function RetriveDOB(uint256 id) public view returns (string memory) {
        return StudentDetails[id].DOB;
    }

    function RetriveGender(uint256 id) public view returns (string memory) {
        return StudentDetails[id].Gender;
    }

    function RetriveClub(uint256 id) public view returns (string memory) {
        return StudentDetails[id].Club;
    }

    function RetriveCourse(uint256 id) public view returns (string memory) {
        return StudentDetails[id].Course;
    }
}
