Notable findings: Associations are deprecated in **parse_resource** gem. Including any relations (**has_many, belongs_to** etc) in the models will throw errors when trying to create a new instance of the object. Associations will be dealt with in a Parse table itself with the use of Pointer, which is a type of column that lets a user set up one-to-one or one-to-many associations. 

For example, if a team belongs to a user, the team table has a Pointer column **owner** that points to the user in the User model who owns/created the team. **@team.owner** query should return the required user. 
