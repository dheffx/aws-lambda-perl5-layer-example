import subprocess

perl_cmd = ["perl", "hello.pl"]

def handler(event, context): 
  result = subprocess.run(perl_cmd, stdout=subprocess.PIPE, check=True)
  return result.stdout.decode('utf-8')