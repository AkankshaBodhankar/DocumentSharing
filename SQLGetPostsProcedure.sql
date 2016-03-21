CREATE procedure sgets(@studentid varchar(50))
as
begin
select TeacherFile,PostID from TeacherPost inner join StudentSubscribed on
TeacherPost.TeacherFile=StudentSubscribed.SubscribedTID where  StudentSubscribed.StudentID=@studentid 
end
