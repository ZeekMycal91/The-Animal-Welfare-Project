-- Create a global variable to track whether a player has already voted
local voted = false

-- Create a global table to store the player data
local players = {}

-- Function to allow a player to register
function registerPlayer(player)
  -- Check that the player has not already voted
  if not voted then
    -- Add the player to the table
    table.insert(players, player)
    -- Return a successful response
    return true
  else 
    -- Return a failed response if the player has already voted
    return false
  end
end

-- Function to allow a player to cast a vote
function castVote(player, vote)
  -- Check if the player has already voted
  if not voted then
    -- Set a boolean to track whether the vote has been carried out
    local successful = false
    -- Loop through the table of players
    for i,p in ipairs(players) do
      -- Check if the current player is the one to vote
      if player == p then
        -- Add the vote to the table
        players[i] = {name = p, vote = vote}
        -- Set the boolean to success
        successful = true
      end
    end
    -- Check if the vote was successful
    if successful then
      -- Set the global vote boolean to true
      voted = true
      -- Return a successful response
      return true
    else
      -- Return a failed response if the player has not registered
      return false
    end
  else
    -- Return a failed response if the player has already voted
    return false
  end
end

-- Function to tally the votes
function tallyVotes()
  -- Create a table to store the results
  local results = {}
  -- Set the vote count for each option to 0
  results.Yay = 0
  results.Nay = 0
  -- Loop through the table of players
  for i,p in ipairs(players) do
    -- Add the vote to the results table
    if p.vote == "Yay" then
      results.Yay = results.Yay + 1
    elseif p.vote == "Nay" then
      results.Nay = results.Nay + 1
    end
  end
  -- Return the results
  return results
end

-- Function to reset the global variables
function resetVoting()
  -- Reset the player table to empty
  players = {}
  -- Reset the vote boolean to false
  voted = false
end