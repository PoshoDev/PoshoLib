function weekday_get_int(str)
{
    switch(str)
    {
        case "sunday":	  case "sun":   return 0;   break;
        case "monday":    case "mon":   return 1;   break;
		case "tuesday":	  case "tue":   return 2;   break;
		case "wednesday": case "wed":   return 3;   break;
		case "thursday":  case "thu":   return 4;   break;
		case "friday":	  case "fri":   return 5;   break;
		case "saturday":  case "sat":   return 6;   break;
    }
}

function month_get_int(str)
{
    switch(str)
    {
        case "january":   case "jan":   return 0;   break;
		case "february":  case "feb":   return 1;   break;
		case "march":     case "mar":   return 2;   break;
		case "april":     case "apr":   return 3;   break;
		case "may":                     return 4;   break;
		case "june":      case "jun":   return 5;   break;
		case "july":      case "jul":   return 6;   break;
		case "august":    case "aug":   return 7;   break;
		case "september": case "sep":   return 8;   break;
		case "october":   case "oct":   return 9;   break;
		case "november":  case "nov":   return 10;  break;
		case "december":  case "dec":   return 11;  break;
    }
}