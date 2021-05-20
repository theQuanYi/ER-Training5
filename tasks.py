from invoke import task

@task
def dep(c):
    c.run("docker build -t super-ros-node .")
