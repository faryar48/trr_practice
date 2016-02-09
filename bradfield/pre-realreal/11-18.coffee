lettersRegex = /^[a-zA-Z]+$/ # bluenote
lettersAndNumbersRegex = /^[a-zA-Z0-9]+$/ # 5t8ANYm2ToLpjV7AxJ1U1N
typeNames = {
  'track': lettersAndNumbersRegex
  'playlist': lettersAndNumbersRegex
  'app': lettersRegex
}

parseEntity = (string) =>
  arr = string.split(':')

  {
    orgName: arr[0]
    typeName: arr[1]
    ID: arr[2]
  }

validateOrgName = (orgName) =>
  orgName === 'spotify'

validateTypeName = (typeName) =>
  typeName in typeNames

validateID = (ID, validatedTypeName) =>
  typeNames[validatedTypeName].test(ID)

validateEntity = (entityString, specificType) =>
  parsedEntity = parseEntity(entityString)
  if (specificType && specificType !== parsedEntity.typeName) {
    return false
  }
  (
    validateOrgName(parsedEntity.orgName) &&
    validateTypeName(parsedEntity.typeName) &&
    validateID(parsedEntity.ID, parsedEntity.typeName)
  )

console.log(validateEntity('spotify:app:test'))

