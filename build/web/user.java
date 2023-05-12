public class user {
    private String fullName;
    private String password;
    private String username;
    private String emailAddress;
    private String gender;

    public user(String fullName, String password, String username, String emailAddress, String gender) {
        this.fullName = fullName;
        this.password = password;
        this.username = username;
        this.emailAddress = emailAddress;
        this.gender = gender;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}