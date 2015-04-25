(* Extract BBEdit placeholder
 * A key press minimising script to extract and apply text from BBEdit Clippings placeholders.
 * Version 0.0.1
 * Oliver Boermans
 * http://www.ollicle.com/
 * @ollicle
 *)

tell application "BBEdit" to tell front window
	activate

	set selectedText to selection

	-- Stop here if no selection
	if (count of characters of selectedText) is equal to 0 then

		beep
		return

	end if

	-- BBEdit placeholder grep pattern
	set findPlaceholder to "(?:<#)(?:\\*)?(.+?)(?:#>)"
	set replacePlaceholder to "\\1"

	-- Text found between the option delimiters
	set placeholderContent to ""

	-- Divides the content of the placeholder into replacement options
	set optionDelimiter to {"| |"}

	-- The text to replace the selected text with
	set replacement to ""

	-- Derived label for the presented options
	set promptKey to ""

	-- Default label for the presented options until a means to extract one is coded
	set defaultKey to "Options"

	-- Find first placeholder and select it
	set placeholder to find findPlaceholder searching in selectedText options {search mode:grep} with selecting match
	if found of placeholder is true then

		-- Store content of placeholder
		set placeholderContent to grep substitution of replacePlaceholder

	else

		-- No placeholder found - use the whole selection
		set placeholderContent to selectedText as string

	end if

	-- Extract any contained replacement options
	set AppleScript's text item delimiters to optionDelimiter
	set foundOptions to text items of placeholderContent

	-- Restore default
	set AppleScript's text item delimiters to {""}

	-- Handle multiple options
	set numOptions to count of foundOptions

	if numOptions is equal to 1 then

		set replacement to placeholderContent

	else

		-- Extract options and promptText
		if numOptions is greater than 2 then

			set promptText to first item of foundOptions

			--	Use default if first option is empty
			if promptText is equal to "" then

				set promptText to defaultKey

			end if

			set optList to rest of every item of foundOptions

		else

			set promptText to defaultKey
			set optList to foundOptions

		end if


		set replacement to choose from list optList ¬
			with title ¬
			"Choose" with prompt ¬
			"" & promptText & ":" default items item 1 of optList ¬
			OK button name ¬
			"Insert" cancel button name ¬
			"Cancel" without empty selection allowed and multiple selections allowed

		-- User cancelled, stop here
		if replacement = false then return

	end if

	set selection to replacement
end tell
