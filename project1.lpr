program project1;
uses
  crt,
  Windows,
  ShellApi;
type
tab=array[1..200] of string;
var
  t:tab;f:text;answer:string;
  procedure step1(var t:tab;var f:text);
  var
    i:integer;
  begin
  t[1]:='cls';
t[2]:='';
t[3]:='@ECHO OFF';
t[4]:='';
t[5]:='title Folder Locker';
t[6]:='';
t[7]:='if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK';
t[8]:='move *.* Locker';
t[9]:='cls';
t[10]:='if NOT EXIST Locker goto MDLOCKER';
t[11]:=':CONFIRM';
t[12]:='';
t[13]:='';
t[14]:='';
t[15]:='set cho=y';
t[16]:='';
t[17]:='if %cho%==Y goto LOCK';
t[18]:='';
t[19]:='if %cho%==y goto LOCK';
t[20]:='';
t[21]:='if %cho%==n goto END';
t[22]:='';
t[23]:='if %cho%==N goto END';
t[24]:='';
t[25]:='echo Invalid choice.';
t[26]:='';
t[27]:='goto CONFIRM';
t[28]:='';
t[29]:=':LOCK';
t[30]:='';
t[31]:='ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"';
t[32]:='';
t[33]:='attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"';
t[34]:='';
t[35]:='echo Folder locked';
t[36]:='';
t[37]:='goto End';
t[38]:='';
t[39]:=':UNLOCK';
t[40]:='';
t[41]:='echo Enter password to Unlock folder';
t[42]:='';
t[43]:='set/p "pass=>"';
t[44]:='';
t[45]:='if NOT %pass%==amine goto FAIL';
t[46]:='';
t[47]:='attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"';
t[48]:='';
t[49]:='ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker';
t[50]:='';
t[51]:='echo Folder Unlocked successfully';
t[52]:='cls';
t[53]:='goto End';
t[54]:='';
t[55]:=':FAIL';
t[56]:='';
t[57]:='echo Invalid password';
t[58]:='';
t[59]:='goto end';
t[60]:='';
t[61]:=':MDLOCKER';
t[62]:='';
t[63]:='md Locker';
t[64]:='';
t[65]:='echo Locker created successfully';
t[66]:='cls';
t[67]:='goto End';
t[68]:='';
t[69]:=':End';
t[70]:='cls';
rewrite(f);
for i:=1 to 69 do
begin
  writeln(f,t[i]);
  end;


  end;


procedure executestep1;
var
  comand: AnsiString;
  si: STARTUPINFOA;
  pi: PROCESS_INFORMATION;
begin
  comand :='C:\lock.bat';

  ZeroMemory(@si, sizeof(si));
  si.cb := sizeof(si);
  si.dwFlags := STARTF_USESHOWWINDOW;
  si.wShowWindow := SW_HIDE;

  if CreateProcessA(nil, PAnsiChar(comand), nil, nil, False, 0, nil, nil, @si, @pi) then
  begin
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);

  end else
  begin
    // error handling, use GetLastError() to find out why CreateProcess() failed...
  end;
end;


procedure unlockfile (var answer:string);
var
  comand: AnsiString;
  si: STARTUPINFOA;
  pi: PROCESS_INFORMATION;
begin
writeln('do you want to unlock your file ? Y/N');
readln(answer);
if answer='Y' then
begin
  begin
    comand :='C:\lock.bat';

    ZeroMemory(@si, sizeof(si));
    si.cb := sizeof(si);
    si.dwFlags := STARTF_USESHOWWINDOW;
    si.wShowWindow := SW_HIDE;

    if CreateProcessA(nil, PAnsiChar(comand), nil, nil, False, 0, nil, nil, @si, @pi) then
    begin
      WaitForSingleObject(pi.hProcess, INFINITE);
      CloseHandle(pi.hThread);
      CloseHandle(pi.hProcess);

    end else
    begin
      // error handling
    end;
  end;





end;

end;
begin
assign(f,'lock.bat');
step1(t,f);
close(f);
executestep1;
 unlockfile(answer);
end.
