# BBEdit Extract Placeholder

The contained AppleScript `Extract placeholder.scpt` augments [BBEdit](http://www.barebones.com/products/bbedit/)’s placeholders by reducing the work required to keep the text included as the placeholder label.

## BBEdit placeholders

A BBEdit placeholder is a portion of text prefixed with `<#` and suffixed with `#>`, e.g. `<#example#>`. Striking TAB on your keyboard when a placeholder is present cause it to be selected – greatly reducing the time and effort to find and edit these portions of the document. Tabbing through the document will highlight each placeholder ready to be replaced when one starts typing.

## Why this script

Typically the text between the placeholder delimiters is intended as a label. Consider this portion of a letter template:

	--
	<#sign off#>
	Oliver Boermans

With `<#sign off#>` selected I can start typing to replace it with the appropriate formality. Although I notice that most of the time I write:

	--
	Yours sincerely
	Oliver Boermans

I could remove the placeholder from the template and it would be right *most* of the time. Alternatively I could use this instead:

	--
	<#Yours sincerely#>
	Oliver Boermans

It is self evident that this is the intended position for a “sign off” and my most frequent selection is pre-filled. This seems great, except now I have the inconvenience of manually removing the placeholder delimiters. This is exactly what this BBEdit script makes effortless.

Evoke the script and the delimiters are removed from the first placeholder found in the selected text.

## One more thing…

There is room for improvement as sometimes I have the arduous task of typing something different:

	--
	Yours faithfully
	Oliver Boermans

Wouldn’t it be nice if my template could store an alternative. Perhaps something like:

	--
	<#Yours sincerely|Yours faithfully#>
	Oliver Boermans

With this placeholder selected evoking the script pops a dialog from which my the appropriate option may be chosen and entered in a snap.

## Keep the label

Although removing the placeholder label `sign off` is no great loss in this particular example, it is easy to imagine scenarios where it would help to indicate the purpose of placeholder. By default the option dialog uses the label “Options”. To customise this designate the first option in the placeholder as the label by prefixing it with a delimiter:

	--
	<#|Sign off|Yours sincerely|Yours faithfully|Cheers|Love#>
	Oliver Boermans

[Insert screenshot]

## Setting a custom option delimiter

[this is not a pipe image]

To use an alternative delimiter (perhaps to use a pipe `|` in your output) specify one by placing the desired character or characters at the very start of the placeholder – separating it from the placeholder options (and custom label if specified) with:

	=|=

For example to use “$” as a delimiter:

	--
	<#$=|=Yours sincerely$Yours faithfully$Cheers$Love#>
	Oliver Boermans

Or a comma “,” and a custom label

	<#,=|=,Sign off,Yours sincerely,Yours faithfully,Cheers,Love#>
	Oliver Boermans


## No delimiter, no!

If nothing precedes the custom delimiter delimiter, the script presumes you don’t want to delimit:

	--
	<#=|=Yours sincerely | Yours faithfully | Cheers | Love#>
	Oliver Boermans

Inserting the whole placeholder text following the custom delimiter delimiter:

	--
	Yours sincerely | Yours faithfully | Cheers | Love
	Oliver Boermans


## Does everything work?

- Line breaks within placeholders are not handled well. For more complex options I suggest creating a Clipping for the purpose.

- Only tested with BBEdit 11



## Installation

Rename the "Extract-Placeholder" directory to "Extract-Placeholder.bbpackage"

Double click it. BBEdit will copy it to the Packages directory of your BBEdit application support directory.

Invoke the script "Extract placeholder" from BBEdit’s Scripts Menu or ideally assign a keyboard short cut of your choosing.

