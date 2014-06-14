Notable findings: Associations are deprecated in **parse_resource** gem. Including any relations (**has_many, belongs_to** etc) in the models will through errors when trying to create a new instance of the object. Associations will be dealt with in Parse itself with the use of Pointers, which are a type of columns that let a user set up one-to-one or one-to-many associations. 

For example, a team belongs to a user, therefore the team table has a Pointer column **owner** that points to the user in the User model who owns/created the team. **@team.owner** query should return the required user. 
