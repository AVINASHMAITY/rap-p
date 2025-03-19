define hierarchy ZCAKM_TEAM_HR
  as parent child hierarchy (
    source ZCAKM_I_TEAM
    child to parent association _Leader
    start where TeamLeader is initial 
    siblings order by UserIdentification
  )
{
  key UserIdentification,
    TeamLeader
    
}
