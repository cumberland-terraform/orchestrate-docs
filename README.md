# Enterprise Terraform 
## Cumberland Cloud Orchestrate 
### SSM Documents

TODO

### Usage

The bare minimum deployment can be achieved with the following configuration,

***providers.tf**

```hcl
provider "aws" {
    region                  = "us-east-1"

    assume_role {
        role_arn            = "arn:aws:iam::<target-account>:role/<target-role>"
    }
}
```
**modules.tf**

```
module "ssm" {
	source 					= "github.com/cumberland-terraform/orchestrate-ssm.git"
	
	platform				= {
		client          	= "<client>"
    	environment         = "<environment>"
	}

	suffix 					= "<suffix>"

}
```
**NOTE**: `platform` is a parameter for *all* **Cumberland Cloud** modules. For more information about the `platform`, in particular the permitted values of the nested fields, refer to the platform module documentation.

### Parameters

There are two main parameters to be aware of when using `cc-orchestrate-docs`:

1. `suffix`: TODO

## Contributing

The below instructions are to be performed within Unix-style terminal. 

It is recommended to use Git Bash if using a Windows machine. Installation and setup of Git Bash can be found [here](https://git-scm.com/downloads/win)

### Step 1: Clone Repo

Clone the repository. Details on the cloning process can be found [here](https://support.atlassian.com/bitbucket-cloud/docs/clone-a-git-repository/)

If the repository is already cloned, ensure it is up to date with the following commands,

```bash
git checkout master
git pull
```

### Step 2: Create Branch

Create a branch from the `master` branch. The branch name should be formatted as follows:

	feature/<TICKET_NUMBER>

Where the value of `<TICKET_NUMBER>` is the ticket for which your work is associated. 

The basic command for creating a branch is as follows:

```bash
git checkout -b feature/<TICKET_NUMBER>
```

For more information, refer to the documentation [here](https://docs.gitlab.com/ee/tutorials/make_first_git_commit/#create-a-branch-and-make-changes)

### Step 3: Commit Changes

Update the code and commit the changes,

```bash
git commit -am "<TICKET_NUMBER> - description of changes"
```

More information on commits can be found in the documentation [here](https://docs.gitlab.com/ee/tutorials/make_first_git_commit/#commit-and-push-your-changes)

### Step 4: Merge With Master On Local


```bash
git checkout master
git pull
git checkout feature/<TICKET_NUMBER>
git merge master
```

For more information, see [git documentation](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)


### Step 5: Push Branch to Remote

After committing changes, push the branch to the remote repository,

```bash
git push origin feature/<TICKET_NUMBER>
```

### Step 6: Pull Request

Create a pull request. More information on this can be found [here](https://www.atlassian.com/git/tutorials/making-a-pull-request).

Once the pull request is opened, a pipeline will kick off and execute a series of quality gates for linting, security scanning and testing tasks.

### Step 7: Merge

After the pipeline successfully validates the code and the Pull Request has been approved, merge the Pull Request in `master`.

After the code changes are in master, the new version should be tagged. To apply a tag, the following commands can be executed,

```bash
git tag v1.0.1
git push tag v1.0.1
```

Update the `CHANGELOG.md` with information about changes.